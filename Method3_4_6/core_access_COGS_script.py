###################################GET COGS FOR CORRESPONDING GENE NAMES#############################################
#####GET RID OF GENE NAMES IN THE STRUCTURE "GROUP_"
import csv
groups_File = open("gene_presence_absence_roary.csv", "r")
core_File = open("core_genes.csv", "r")
access_File = open("accessory_genes.csv", "r")
lines_g = groups_File.readlines()
lines_c = core_File.readlines()
lines_a = access_File.readlines()

result = ""
for line_c in lines_c:
    for line_g in lines_g:
        if line_c.split(",")[0].replace("\n","").replace('"','') == line_g.split(",")[0].replace("\n",""):
            if (line_g.split(",")[1].replace("\n","") != ""):
                result = result + line_g.split(",")[1].replace("\n","") + "\n"

result_access = ""
for line_a in lines_a:
    for line_g in lines_g:
        if line_a.split(",")[0].replace("\n","").replace('"','') == line_g.split(",")[0].replace("\n",""):
            if (line_g.split(",")[1].replace("\n","") != ""):
                result_access = result_access + line_g.split(",")[1].replace("\n","") + "\n"

newFile1 = open("Core_groups.txt", "w")
newFile1.write(result)
newFile1.close()
newFile2 = open("Access_groups.txt", "w")
newFile2.write(result_access)
newFile2.close()
core_File.close()
groups_File.close()

#####GET COGS FOR ACCESSORY AND CORE GENES
#open the target files, core_File to get the core gene names, access_File to get accessory gene names, and COG_File to
#get the corresponding COGs
core_File = open("Core_groups.txt","r")
access_File = open("Access_groups.txt","r")
COG_File = open("all_genes.tsv","r")
#read lines from all files
lines_c = core_File.readlines()
lines_a = access_File.readlines()
lines_cog = COG_File.readlines()

###GET THE COGS FOR CORE GENES
core_results = ""
#for each line in core gene names and for each line in COG file (gene names + COGs)
for line_c in lines_c:
    add = ""
    for line_cog in lines_cog:
        for i in range(len(line_c.split(";"))):
            #if core gene name is the same in the core_File and COG_File, and the COG column is not empty add to results
            if (line_c.split(";")[i].replace("\n","") == line_cog.split(" ")[1].replace("\n","")) and line_cog.split(" ")[2].replace("\n","") != "":
                add = line_cog.split(" ")[1].replace("\n","") + "\t" + line_cog.split(" ")[2].replace("\n","") + "\n"
                core_results = core_results + add
            if add != "":
                break
        #if this gene's COG has already been found, break and move on to the next core gene name
        if add != "":
            break

###GET THE COGS FOR ACCESSORY GENES
access_results = ""
#for each line in accessory gene names and for each line in COG file (gene names + COGs)
for line_a in lines_a:
    add = ""
    for line_cog in lines_cog:
        for i in range(len(line_a.split(";"))):
            #if accessory gene name is the same in the access_File and COG_File, and the COG column is not empty, add to results
            if (line_a.split(";")[i].replace("\n","") == line_cog.split(" ")[1].replace("\n","")) and line_cog.split(" ")[2].replace("\n","") != "":
                add = line_cog.split(" ")[1].replace("\n","") + "\t" + line_cog.split(" ")[2].replace("\n","") + "\n"
                access_results = access_results + add
            if add != "":
                break
        #if this gene's COG has already been found, break and move on to the next accessory gene name
        if add != "":
            break

#open a file to write the results in (core genes), write and close the file
newFile1 = open("Core_COGs.txt", "w")
newFile1.write(core_results)
newFile1.close()
#open a file to write the results in (accessory genes), write and close all files
newFile2 = open("Access_COGs.txt", "w")
newFile2.write(access_results)
newFile2.close()
core_File.close()
COG_File.close()
access_File.close()

#####REMOVE COGS WITHOUT CORRESPONDING GENE NAME
core_f = open("Core_COGs.txt","r")
access_f = open("Access_COGs.txt","r")
c_lines = core_f.readlines()
a_lines = access_f.readlines()

a_results = ""
#look at the newly created file line by line
for a_line in a_lines:
    #if the gene name is not empty, add it to the new string
    if a_line.split("\t")[0] != "":
        a_results = a_results + a_line.split("\t")[0] + "\t" + a_line.split("\t")[1].replace("\n","") + "\n"

c_results = ""
#look at the newly created file line by line
for c_line in c_lines:
    #if the gene name is not empty, add it to the new string
    if c_line.split("\t")[0] != "":
        c_results = c_results + c_line.split("\t")[0] + "\t" + c_line.split("\t")[1].replace("\n","") + "\n"

#write the new results to new files, close all files
newF1 = open("Core_genes_COGs.txt","w")
newF2 = open("Access_genes_COGs.txt","w")
newF1.write(c_results)
newF2.write(a_results)
newF1.close()
newF2.close()
core_f.close()
access_f.close()

###REMOVE DUPLICATES
existing_genes = ["no_gene"]
end_core_result = ""
#for each line in core gene list
for line_core in lines_core:
    does_exist = False
    this_gene = line_core.split("\t")[0]
    #for each element in existing genes list
    for i in range(len(existing_genes)):
        #if the gene is equal to gene name in existing_genes list, make does_exist = TRUE, and break
        if existing_genes[i-1] == this_gene:
            does_exist = True
            break
    #if does_exist is TRUE for this gene, break gene loop
    if does_exist == True:
        continue
    #if does_exist is FALSE for this gene, add it to existing_genes list, and add gene name+COGs to result
    else:
        existing_genes.append(line_core.split("\t")[0])
        end_core_result = end_core_result + line_core.split("\t")[0] + "\t" + line_core.split("\t")[1].replace("\n","") + "\n"

existing_access_genes = ["no_gene"]
end_access_result = ""
#for each line in accessory gene list
for line_access in lines_access:
    does_exist = False
    this_gene = line_access.split("\t")[0]
    #for each element in existing genes list
    for i in range(len(existing_access_genes)):
        #if the gene is equal to gene name in existing_genes list, make does_exist = TRUE, and break
        if existing_access_genes[i-1] == this_gene:
            does_exist = True
            break
    #if does_exist is TRUE for this gene, continue gene loop
    if does_exist == True:
        continue
    #if does_exist is FALSE for this gene, add it to existing_genes list, and add gene name+COGs to result
    else:
        existing_access_genes.append(line_access.split("\t")[0])
        end_access_result = end_access_result + line_access.split("\t")[0] + "\t" + line_access.split("\t")[1].replace("\n","") + "\n"

new_write1 = open("new_access_COGs.txt","w")
new_write2 = open("new_core_COGs.txt","w")
new_write1.write(end_access_result)
new_write2.write(end_core_result)
new_write1.close()
new_write2.close()
coregene_File.close()
accessgene_File.close()

#######GET THE CATEGORIES (LETTERS) CORRESPONDING TO EACH COG, FROM COG DATABASE
#open the target files, core_File to get the core gene names, access_File to get accessory gene names, and COG_File to
#get the corresponding COGs and categories
core_File = open("new_core_COGs.txt","r")
access_File = open("new_access_COGs.txt","r")
COG_File = open("cog-20.def.tab","r", encoding = "latin-1") #not utf-8, probably contains undefined characters. try latin-1 or cp1252
#read lines from all files
lines_c = core_File.readlines()
lines_a = access_File.readlines()
lines_cog = COG_File.readlines()

#GET COG CATEGORIES FOR CORE GENES LIST
core_categories = ""
for line_c in lines_c:
    add = ""
    for line_cog in lines_cog:
        if line_c.split("\t")[1].replace("\n","") == line_cog.split("\t")[0]:
            add = line_c.split("\t")[0] + "\t" + line_c.split("\t")[1].replace("\n","") + "\t" + line_cog.split("\t")[1] + "\n"
            core_categories = core_categories + add
        #if this core gene was found a category, stop searching the COG list, move on to next gene
        if add != "":
            break

#GET COG CATEGORIES FOR ACCESSORY GENES LIST
access_categories = ""
for line_a in lines_a:
    add = ""
    for line_cog in lines_cog:
        if line_a.split("\t")[1].replace("\n","") == line_cog.split("\t")[0]:
            add = line_a.split("\t")[0] + "\t" + line_a.split("\t")[1].replace("\n","") + "\t" + line_cog.split("\t")[1] + "\n"
            access_categories = access_categories + add
        #if this core gene was found a category, stop searching the COG list, move on to next gene
        if add != "":
            break

write_F1 = open("core_COGs_categories.txt", "w")
write_F2 = open("access_COGs_categories.txt", "w")
write_F1.write(core_categories)
write_F2.write(access_categories)
write_F1.close()
write_F2.close()
core_File.close()
access_File.close()
COG_File.close()

########REMOVE DOMAINS OF PROTEINS & DUPLICATES
core_File = open("core_COGs_categories.txt","r")
access_File = open("access_COGs_categories.txt","r")
lines_c = core_File.readlines()
lines_a = access_File.readlines()

#remove after _ in gene names (core genes)
result_core = ""
for line_c in lines_c:
    gene_name = line_c.split("\t")[0]
    if "_" in gene_name:
        result_core = result_core + gene_name.split("_")[0] + "\t" + line_c.split("\t")[1] + "\t" + line_c.split("\t")[2]
    else:
        result_core = result_core + gene_name + "\t" + line_c.split("\t")[1] + "\t" + line_c.split("\t")[2]

#remove after _ in gene names(accessory genes)
result_access = ""
for line_a in lines_a:
    gene_name = line_a.split("\t")[0]
    if "_" in gene_name:
        result_access = result_access + gene_name.split("_")[0] + "\t" + line_a.split("\t")[1] + "\t" + line_a.split("\t")[2]
    else:
        result_access = result_access + gene_name + "\t" + line_a.split("\t")[1] + "\t" + line_a.split("\t")[2]

#write to file
writeFile_core = open("new_core_categories.txt","w")
writeFile_access = open("new_access_categories.txt","w")
writeFile_core.write(result_core)
writeFile_access.write(result_access)
writeFile_core.close()
writeFile_access.close()
core_File.close()
access_File.close()

#open written files
fileCore = open("new_core_categories.txt","r")
fileAccess = open("new_access_categories.txt","r")
lines_core = fileCore.readlines()
lines_access = fileAccess.readlines()

#remove duplicates (core)
existing_genes = ["no_gene"]
end_core_result = ""
#for each line in core gene list
for line_core in lines_core:
    does_exist = False
    this_gene = line_core.split("\t")[0]
    #for each element in existing genes list
    for i in range(len(existing_genes)):
        #if the gene is equal to gene name in existing_genes list, make does_exist = TRUE, and break
        if existing_genes[i-1] == this_gene:
            does_exist = True
            break
    #if does_exist is TRUE for this gene, break gene loop
    if does_exist == True:
        continue
    #if does_exist is FALSE for this gene, add it to existing_genes list, and add gene name+COGs to result
    else:
        existing_genes.append(line_core.split("\t")[0])
        end_core_result = end_core_result + line_core.split("\t")[0] + "\t" + line_core.split("\t")[1] + "\t" + line_core.split("\t")[2]

#remove duplicates (access)
existing_genes = ["no_gene"]
end_access_result = ""
#for each line in core gene list
for line_access in lines_access:
    does_exist = False
    this_gene = line_access.split("\t")[0]
    #for each element in existing genes list
    for i in range(len(existing_genes)):
        #if the gene is equal to gene name in existing_genes list, make does_exist = TRUE, and break
        if existing_genes[i-1] == this_gene:
            does_exist = True
            break
    #if does_exist is TRUE for this gene, break gene loop
    if does_exist == True:
        continue
    #if does_exist is FALSE for this gene, add it to existing_genes list, and add gene name+COGs to result
    else:
        existing_genes.append(line_access.split("\t")[0])
        end_access_result = end_access_result + line_access.split("\t")[0] + "\t" + line_access.split("\t")[1] + "\t" + line_access.split("\t")[2]

#write to files
newFile_core = open("no_dupl_core_categories","w")
newFile_access = open("no_dupl_access_categories","w")
newFile_core.write(end_core_result)
newFile_access.write(end_access_result)
newFile_core.close()
newFile_access.close()
fileCore.close()
fileAccess.close()


##################################COUNT THE NUMBER OF GENES IN EACH COG CATEGORY#######################################
core_COG = open("no_dupl_core_categories.txt","r")
access_COG = open("no_dupl_access_categories.txt","r")
lines_c = core_COG.readlines()
lines_a = access_COG.readlines()


core_categories = []
#Get all unique categories in the file without counting them. These will be the keys of the dictionary to store counts.
#for each line in core COGs file
for line_c in lines_c:
    this_category = line_c.split("\t")[2].replace("\n","")
    category_exists = False
    #if the gene is annotated to only one category
    if len(this_category) == 1:
        #look at all categories found (already in list)
        for i in range(len(core_categories)):
            #if the category at hand was already found, break
            if core_categories[i] == this_category:
                category_exists = True
                break
        if category_exists:
            continue
        #if the category was not added before, append it to the categories that exist (list)
        else:
            core_categories.append(this_category)
    #if gene is annotated to more than one category
    else:
        #look through all categories this gene is annotated to
        for j in range(len(this_category)):
            this_sub_category = this_category[j]
            #look through all categories found(in list)
            for k in range(len(core_categories)):
                #if this category was found, break
                if core_categories[k] == this_sub_category:
                    category_exists = True
                    break
            if category_exists:
                continue
            #if this category was not added before, append it to the categories that exist (list)
            else:
                core_categories.append(this_sub_category)

#Prepare the dictionary, count the genes for each key
core_dict = {}
for i in range(len(core_categories)):
    count = 0
    for line_c in lines_c:
        this_genes_cat = line_c.split("\t")[2].replace("\n","")
        if len(this_genes_cat) == 1:
            if core_categories[i] == this_genes_cat:
                count += 1
        else:
            for j in range(len(this_genes_cat)):
                if core_categories[i] == this_genes_cat[j]:
                    count += 1
    core_dict[core_categories[i]] = count

#do the same steps for accessory genes
access_categories = []
for line_a in lines_a:
    this_category = line_a.split("\t")[2].replace("\n","")
    category_exists = False
    if len(this_category) == 1:
        for i in range(len(access_categories)):
            if access_categories[i] == this_category:
                category_exists = True
                break
        if category_exists:
            continue
        else:
            access_categories.append(this_category)
    else:
        for j in range(len(this_category)):
            this_sub_category = this_category[j]
            for k in range(len(access_categories)):
                if access_categories[k] == this_sub_category:
                    category_exists = True
                    break
            if category_exists:
                continue
            else:
                access_categories.append(this_sub_category)

access_dict = {}
for i in range(len(access_categories)):
    count = 0
    for line_a in lines_a:
        this_genes_cat = line_a.split("\t")[2].replace("\n","")
        if len(this_genes_cat) == 1:
            if access_categories[i] == this_genes_cat:
                count += 1
        else:
            for j in range(len(this_genes_cat)):
                if access_categories[i] == this_genes_cat[j]:
                    count += 1
    access_dict[access_categories[i]] = count

newFile1 = open("core_counts_category.txt","w")
newFile2 = open("access_counts_category.txt","w")
for k, v in core_dict.items():
    newFile1.write(str(k) + ' - '+ str(v) + '\n')
for k, v in access_dict.items():
    newFile2.write(str(k) + ' - '+ str(v) + '\n')
newFile1.close()
newFile2.close()
access_COG.close()
core_COG.close()

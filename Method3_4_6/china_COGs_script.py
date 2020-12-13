###############################GET COGS FOR ALL GENES IN CHINA CLUSTER###############################
COG_file = open("all_genes.tsv","r")
genome_file = open("china_cluster.txt","r")
lines_cog = COG_file.readlines()
lines_g = genome_file.readlines()

#make an array consisting of the genome names in China Cluster
genomes = ""
for line_g in lines_g:
    genomes = genomes+line_g
genome = genomes.split("\n")

#search all genes containing COGs, match the genome names, and get the COGs each genome contains
result_cogs = ""
for i in range(len(genome)):
    for line_cog in lines_cog:
        if line_cog.split(" ")[0] != "":
            #get GUT_GENOME#####, which is the specific genome name
            gen = line_cog.split(" ")[0].split("_")[0] + "_" + line_cog.split(" ")[0].split("_")[1]
        else:
            continue
            #if the genome name is same in the COG file & the COG column is not empty, add it to results
        if gen == genome[i] and line_cog.split(" ")[2] != "":
            result_cogs = result_cogs + genome[i] + "\t" + line_cog.split(" ")[1] + "\t" + line_cog.split(" ")[2].replace("\n","") + "\n"

newFile = open("china_COGs.txt","w")
newFile.write(result_cogs)
newFile.close()
COG_file.close()
genome_file.close()

china_file = open("china_COGs.txt","r")
lines_china = china_file.readlines()

#remove domains
result_no_domain = ""
for line_china in lines_china:
    gene_name = line_china.split("\t")[1]
    if "_" in gene_name:
        result_no_domain = result_no_domain + gene_name.split("_")[0] + "\t" + line_china.split("\t")[2]
    else:
        result_no_domain = result_no_domain + gene_name + "\t" + line_china.split("\t")[2]

newFile = open("china_COGs_no_domains.txt","w")
newFile.write(result_no_domain)
newFile.close()
china_file.close()

no_dom_china_file = open("china_COGs_no_domains.txt","r")
lines_china = no_dom_china_file.readlines()

###remove duplicates
existing_genes = {}
end_china_result = ""
genome_no = ""
for line_china in lines_china:
    prev_genome_no = genome_no
    genome_no = line_china.split("\t")[0]
    does_exist = False
    this_gene = line_china.split("\t")[1]
    if prev_genome_no == genome_no:
        if this_gene != "" and (this_gene in existing_genes.keys()):
            does_exist = True
        if does_exist == True:
            continue
        elif does_exist == False and this_gene != "":
            existing_genes[this_gene] = 1
            end_china_result = end_china_result + line_china.split("\t")[0] + "\t" + line_china.split("\t")[1] + "\t" + line_china.split("\t")[2].replace("\n","") + "\n"
    #if the previous genome is different than this one, reset the existing genes array & add the gene at hand to existing genes
    else:
        existing_genes = {}
        if this_gene != "":
            existing_genes[this_gene] = 1
            end_china_result = end_china_result + line_china.split("\t")[0] + "\t" + line_china.split("\t")[1] + "\t" + line_china.split("\t")[2].replace("\n","") + "\n"

newFile = open("china_COGs_no_dupl.txt","w")
newFile.write(end_china_result)
newFile.close()
no_dom_china_file.close()

##########################################GET THE CATEGORIES CORRESPONDING TO EACH COG#################################
###get COG categories
china_file = open("china_COGs_no_dupl.txt","r")
COG_file = open("cog-20.def.tab","r", encoding = "latin-1") #not utf-8, probably contains undefined characters. try latin-1 or cp1252
#read lines from all files
lines_china = china_file.readlines()
lines_cog = COG_file.readlines()

china_categories = ""
for line_china in lines_china:
    add = ""
    for line_cog in lines_cog:
        if line_china.split("\t")[2].replace("\n","") == line_cog.split("\t")[0]:
            add = line_china.split("\t")[0] + "\t" + line_china.split("\t")[1] + line_china.split("\t")[2] + "\t" + line_cog.split("\t")[1] + "\n"
            china_categories = china_categories + add
        #if this core gene was found a category, stop searching the COG list, move on to next gene
        if add != "":
            break

newFile = open("china_COGs_categories.txt","w")
newFile.write(china_categories)
newFile.close()
china_file.close()
COG_file.close()

################################COUNT NUMBER OF GENES BELONGING TO EACH CATEGORY######################################

china_categories = open("china_COGs_categories.txt","r")
lines_china = china_categories.readlines()

#get each vategory name in an array without counting them
categories = []
#for each line in core COGs file
for line_china in lines_china:
    this_category = line_china.split("\t")[3].replace("\n","")
    category_exists = False
    #if the gene is annotated to only one category
    if len(this_category) == 1:
        #look at all categories found (already in list)
        for i in range(len(categories)):
            #if the category at hand was already found, break
            if categories[i] == this_category:
                category_exists = True
                break
        if category_exists:
            continue
        #if the category was not added before, append it to the categories that exist (list)
        else:
            categories.append(this_category)
    #if gene is annotated to more than one category
    else:
        #look through all categories this gene is annotated to
        for j in range(len(this_category)):
            this_sub_category = this_category[j]
            #look through all categories found(in list)
            for k in range(len(categories)):
                #if this category was found, break
                if categories[k] == this_sub_category:
                    category_exists = True
                    break
            if category_exists:
                continue
            #if this category was not added before, append it to the categories that exist (list)
            else:
                categories.append(this_sub_category)

#put each category in a dictionary after counting them
dict = {}
for i in range(len(categories)):
    count = 0
    for line_china in lines_china:
        this_genes_cat = line_china.split("\t")[3].replace("\n","")
        if len(this_genes_cat) == 1:
            if categories[i] == this_genes_cat:
                count += 1
        else:
            for j in range(len(this_genes_cat)):
                if categories[i] == this_genes_cat[j]:
                    count += 1
    dict[categories[i]] = count

newFile = open("china_counts_categories.txt","w")
for k, v in dict.items():
    newFile.write(str(k) + ' - '+ str(v) + '\n')
newFile.close()
china_categories.close()

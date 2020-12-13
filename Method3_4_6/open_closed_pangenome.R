##############################################
##########OPEN OR CLOSED PANGENOME############
##############################################
setwd("/Users/pinaronat/Desktop/IBP")
gene_presence_abscence <- read.table("gene_presence_absence.Rtab", sep = "\t", header = TRUE)

gene_presence_abscence_omit <- na.omit(gene_presence_abscence[ ,2:418])

gene_presence_abscence_omit <- na.omit(gene_presence_abscence)

###############################################
# LOOK AT GENE DISTRIBUTION (PLOT)
all_genes <- gene_presence_abscence_omit
gene_counts <- vector()
genome <- rep(1:418)
for (i in 1:17582) {
  count <- sum(all_genes[i,2:418])
  gene_counts[i] <- count
}
match(395,gene_counts)
barplot(gene_counts,genome, names.arg=c("1", rep("", 3998),"4000",rep("",13581), "17582"), xlab = "Genes", ylab = "Genomes")
abline(v = 1972, col = "red")

# DECIDE WHERE TO CUT THE TAIL
gene_count_notail <- vector()
for (i in 1:17582) {
  count <- sum(all_genes[i,2:418])
  if (count > 1) {
    gene_count_notail[i] <- count
  }
}

barplot(gene_count_notail,genome)

################################################
# REMOVE TAIL (CONTAMINATION) FROM GENES
#Cut the genes that are only found in one genome, possible contamination

genes_no_tail <- data.frame()
in_genomes <- 0
for (i in 1:17582) {
  in_genomes <- sum(all_genes[i,2:418])
  if (in_genomes > 1) {
    genes_no_tail <- rbind(genes_no_tail, all_genes[i,])
  }
  in_genomes <- 0
}


################################################
set.seed(1)
V <- rep(2:418, each=1)
count <- 1
genes_exist <- vector()
genes_exist_size <- vector()
len <- seq(from = 418, to = 2, by = -1)
for(i in len){
  # first genome is V[i] and traverse all genome
  genome <- genes_no_tail[,i]
  # Traverse the list and add to genes_exist list if it is not already in the list
  for(j in 1:length(genome)){
    if(genome[j] == 1){
      if(as.vector(genes_no_tail[j,1]) %in% genes_exist){
        # Do nothing
      }else{
        # Add it to the genes_exist list
        genes_exist[count] <- as.vector(genes_no_tail[j,1])
        count <- count + 1
      }
    }
  }
  # Add the new size of the genes_exist to genes_exist_size to see how many new genes are added
  genes_exist_size[i] <- length(genes_exist)  
}

#invert the gene sized vector, it sould start from the gene in the least number of genomes, increasing
genes_e_size <- vector()
for (i in 1:length(genes_exist_size)) {
  genes_e_size[i] <- genes_exist_size[419-i]
}

#plot the result
genes_exist_size[1] <- 0
plot(rep(1:418),genes_e_size, xlab="Genomes", ylab="Genes", col = "aquamarine2", cex = 1.1, main = "Open vs Closed Pangenome")
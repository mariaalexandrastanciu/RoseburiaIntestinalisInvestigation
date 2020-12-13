getwd()
setwd("/Users/pinaronat/Desktop")
gene_rtab <- read.table(file = "gene_presence_absence.Rtab", header = TRUE, stringsAsFactors = FALSE)

core_genes <- data.frame()
access_genes <- data.frame()
for (i in 1:17582) {
  count <- sum(gene_rtab[i,2:418])
  as.integer(count)
  if (count >= 395) {
    core_genes <- rbind(core_genes, as.vector(gene_rtab[i,]$Gene))
  } else {
    access_genes <- rbind(access_genes, as.vector(gene_rtab[i,]$Gene))
  }
}

write.csv(core_genes, "core_genes.csv", row.names = FALSE)
write.csv(access_genes, "accessory_genes.csv", row.names = FALSE)

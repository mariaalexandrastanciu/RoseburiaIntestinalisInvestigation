setwd("/Users/erimerdal/Desktop/Hayat/Belcika/2.1/IBP")
gene_presence_abscence <- read.table("gene_presence_absence.Rtab", sep = "\t", header = TRUE)

# sum(gene_presence_abscence[3,2:418])
# Without any filters:

# Split core genome and accessory genome
gene_presence_abscence_omit <- na.omit(gene_presence_abscence[ ,2:418])
remove_index <- 0
count <- 1
for(i in 1:dim(gene_presence_abscence_omit)[1]){ # For each row
  if(sum(gene_presence_abscence_omit[i,]) > 0.9 * dim(gene_presence_abscence_omit)[2]){
    remove_index[count] <- i
    count <- count + 1
  }
}
accessory_genes <- gene_presence_abscence_omit[-remove_index,]

# 2- K-modes algorithm
install.packages("klaR")
library(klaR)
iter <- c(5,10,15,20,25,30,40,50)
res <- c(0,0,0,0,0,0,0,0)
gene_presence_abscence_omit <- na.omit(gene_presence_abscence[ ,2:418])
summary(gene_presence_abscence) # Get info about dataset
for(i in 1:8){
  temp <- kmodes(gene_presence_abscence_omit,iter[i],iter.max=50,fast=TRUE)
  res[i] <- sum(temp$withindiff)
}

plot(iter, res, pch=5, xlim=c(1,60),xlab="Number of Modes", ylab="Summed Between Group Distances" , main = "Selecting Best Model", xaxt = "n")
axis(1, at=iter, labels = iter)
lines(iter,res, col = "gray")

# 4- PCA 
# Collect the continents and then colors for each continents for each genome
genome_names <- colnames(accessory_genes)
geolocation <- read.csv("genomes_geolocation.tsv",sep="\t")
continents <- 0
colors <- 0
for(i in 1:length(genome_names)){
  # Find which genome belongs to which country
  continents[i] <- as.vector(geolocation$Continent__autocolour[which(geolocation$ID == genome_names[i])])
}
library(stringr)
colors <- continents
colors <- str_replace(colors, "Asia", "green") # a kind of green
colors <- str_replace(colors, "Europe", "yellow") # yellow, dim
colors <- str_replace(colors, "North_America", "orange") # an orange
colors <- str_replace(colors, "Oceania", "blue") # blue
# Need to color PCA according to the colors found in the phylogeny
library(vegan)
cluster_genomes <- t(accessory_genes)
prin_comp <- rda(cluster_genomes, scale=TRUE)
pca_scores <- scores(prin_comp)
plot(pca_scores$sites[,1],
     pca_scores$sites[,2],
     pch=20,
     col=colors,
     xlim=c(-2,2), 
     ylim=c(-2,2),
     xlab="1st PC",
     ylab="2nd PC",)
legend(-2,2,legend=c("Asia","Europe","North America", "Ocenia"), col=c("green","yellow","orange","blue"), lwd=c(NA,NA,NA,NA),pch=c(19,19,19,19),cex=0.5)


# 5- Jaccard distance 
install.packages("philentropy")
library(philentropy)
distances <- distance(t(gene_presence_abscence_omit), method = "jaccard") # computes between the rows therefore need to transpose the matrix before calculating

# k-medoids clustering, promising
# First clean the core genome because it reduces the distances between genomes quite harmfully. 

iter <- c(5,10,15,20)
obj <- c(0,0,0,0,0,0,0)
for(i in 1:8){
  clara_res <- clara(t(gene_presence_abscence_omit), iter[i], metric = c("jaccard"),
        stand = FALSE, medoids.x = TRUE,
        keep.data = TRUE, rngR = FALSE, pamLike = FALSE, correct.d = TRUE)
  obj[i] <- clara_res$objective
}

plot(iter, obj, pch=5, xlim=c(5,20),xlab="Number of Medoids", ylab="Objectives" , main = "Selecting Best Model", xaxt = "n")
axis(1, at=iter, labels = iter)
lines(iter,obj, col = "gray")

pam_res <- pam(t(gene_presence_abscence_omit),5)
plot(silhouette(clara_res))

################################################
# Question 3- Open or closed pangenome
gene_presence_abscence_omit <- na.omit(gene_presence_abscence)
# List of genes
genes_exist <- vector()
genes_exist_size <- vector()
count <- 1
################################################
# TRY REMOVING CORE GENOME AND THEN TRYING AGAIN
setwd("/Users/erimerdal/Desktop/2.1/IBP")
accessory_genes <- read.csv("accessgenes.txt", header = FALSE)
genes_accessory <- gene_presence_abscence_omit
for(i in 1:length(accessory_genes)){
  genes_accessory <- genes_accessory[!(genes_accessory$Gene==as.vector(accessory_genes[i,1])),]
}

################################################
# Sampling without repetition
set.seed(1)
V <- rep(2:418, each=1)
# Obtaining the unique vector of those values
V_unique <- sample(V)
for(i in 2:length(V)){
  # first genome is V[i] and traverse all genome
  genome <- gene_presence_abscence_omit[,V_unique[i]]
  # Traverse the list and add to genes_exist list if it is not already in the list
  for(j in 1:length(genome)){
    if(genome[j] == 1){
      if(as.vector(gene_presence_abscence_omit[j,1]) %in% genes_exist){
        # Do nothing
      }else{
       # Add it to the genes_exist list
        genes_exist[count] <- as.vector(gene_presence_abscence_omit[j,1])
        count <- count + 1
      }
    }
  }
  # Add the new size of the genes_exist to genes_exist_size to see how many new genes are added
  genes_exist_size[i] <- length(genes_exist)
}
genes_exist_size[1] <- 0
plot(rep(1:417),genes_exist_size, xlab="Genomes", ylab="Genes", pch = 20, col = "red", cex = 1.1, main = "Open vs Closed Pangenome")

#

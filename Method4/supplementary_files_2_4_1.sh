#!/bin/bash

cd GUT_GENOME_PROKA;
# get annotated genes from Prokka .tsv output files from every genome
# columns on new file annotate_gene.tsv: locus_tag, gene, COG, product
for i in `find . -name "GUT_GENOME*.tsv" -type f`; do	
   awk -F "\t" '{if ($7 != "hypothetical protein") {print $1,$4,$6,$7}}' $i > annotate_gene.tsv
   cat annotate_gene.tsv >> all_genes.tsv
done

# search in COG and product columns
# for transposable elements
grep 'transpos' all_genes.tsv > transpose_genes.tsv

# for phages
grep 'vir\|integrase\|ICE\|phage\|excisionase'  all_genes.tsv > vir_genomes.tsv
	# search for int genes only on the $2 gene name column
awk '{print $2}' all_genes.tsv | grep 'int' | sort | uniq -c

# for ISs
grep ' IS \|insertion sequence'  all_genes.tsv > is_genomes.tsv


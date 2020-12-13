#subtract from phage genes te genome id and the phage gene
awk '{print substr($1,1,16),$2}' phage_genes.tsv > genome_phage.tsv
tr ';' ' ' < genomes_geo_teta.tsv > genomes_geo_teta1.tsv
awk -F' ' 'NR==FNR{a[$1]=$2; next} {print $0,a[$1]}'  genome_phage.tsv genomes_geo_teta1.tsv > genome_meta_t_p.tsv
awk -F ' ' '$7=="" {$7="NA"}'1 genome_meta_t_p.tsv > genome_meta_t_p1.tsv

awk '{print substr($1,1,16),$2}' transpose_genes.tsv > genome_transpose.tsv
awk -F' ' 'NR==FNR{a[$1]=$2; next} {print $0,a[$1]}'  genome_transpose.tsv genome_meta_t_p1.tsv  > genome_meta_a_p_t1.tsv
awk -F ' ' '$8=="" {$8="NA"}'1 genome_meta_a_p_t1.tsv > genome_meta_a_p_t2.tsv
#delete head of the table
sed '1d' genome_meta_a_p_t2.tsv > genome_meta_a_p_t3.tsv
#add complete header
sed  -i '1i ID Country__autocolour Continent__autocolour Latitude Longitude Tetracyline__autocolour Phage__autocolour Transpose__autocolour' genome_meta_a_p_t3.tsv
#add ; separator as microreact asks
tr ' ' ';' < genome_meta_a_p_t3.tsv > genome_meta_a_p_t4.tsv
#give better name
cp genome_meta_a_p_t4.tsv genome_meta_anti_phage_trans.tsv



### full virology
grep 'vir\|integrase\|ICE\|phage\|int'  all_genes.tsv > vir_genomes.tsv

awk '{print substr($1,1,16),$2,$3,$4,$5,$6,$7,$8,$9,$10}' vir_genomes.tsv > 1vir_genomes.tsv
sort 1vir_genomes.tsv | uniq > 2vir_genomes.tsv
awk 'NR==1 { print ; next }
{ A[$1]=A[$1]","$2 }
END { for(X in A) print X,substr(A[X],2) }' 2vir_genomes.tsv > 3vir_genomes.tsv

awk -F' ' 'NR==FNR{a[$1]=$2; next} {print $0,a[$1]}'  3vir_genomes.tsv genomes_meta1.tsv > genome_vir.tsv
sed '1d' genome_vir.tsv > genome_meta_virulence.tsv

sed  -i '1i ID Country__autocolour Continent__autocolour Latitude Longitude 
Tetracyline__autocolour Phage__autocolour Transpose__autocolour 
Virulence__autocolour' genome_meta_virulence.tsv

#cluster 9 virulence
grep 'virD\|PhiRV2\|ICEBs1\|intQ\|traG\|XerC\|XerD\|yfDH'  all_genes.tsv > vir_genomes.tsv
awk '{print substr($1,1,16),$2}' vir_genomes.tsv > 1vir_genomes.tsv
sort 1vir_genomes.tsv | uniq > 2vir_genomes.tsv
awk 'NR==1 { print ; next }
{ A[$1]=A[$1]","$2 }
END { for(X in A) print X,substr(A[X],2) }' 2vir_genomes.tsv > 3vir_genomes.tsv

sed  -i '1i ID Country__autocolour Continent__autocolour Latitude Longitude Tetracyline__autocolour Phage__autocolour Transpose__autocolour Virulence__autocolour Cluster9Vir__autocolour' 2genome_metadata_clust9.tsv

sed  's/,/\\/g' 2genome_metadata_clust9.tsv > 3genome_metadata_clust9.tsv

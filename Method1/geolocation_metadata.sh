#!/bin/sh
#take only the columns needed
cat genomes_metadata.tsv | sed 's/|/ /' | awk '{print $1, $23,$24}' > genomes_geolocation.tsv
#add header
sed  -i '1i ID Country__autocolour Continent__autocolour' genomes_geolocation.tsv
#make the 3 columns separated by space
awk -F ' ' -v OFS=' ' '$2 == "United" { $2 = $2"_"$3 }1' genomes_geolocation.tsv> genomes_geolocation_new.tsv
 awk -F ' ' -v OFS=' ' '$3 == "Kingdom" { $3 = "Europe" }1' genomes_geolocation_new.tsv> genomes_geolocation_new_2.tsv
awk -F ' ' -v OFS=' ' '$3 == "States" { $3 = "North_America" }1' genomes_geolocation_new_2.tsv> genomes_geolocation_new_3.tsv
awk -F ' ' -v OFS=' ' '$2 == "Canada" { $3 = "North_America" }1' genomes_geolocation_new_3.tsv> genomes_geolocation_new_4.tsv
#add lat and log from file countries.tsv
awk -F' ' 'NR==FNR{a[$1]=$2;}NR!=FNR{print $0, a[$2]}' countries.tsv genomes_geolocation_new_4.tsv >genomes_geolocation_new_9.tsv
awk -F' ' 'NR==FNR{a[$1]=$3;}NR!=FNR{print $0, a[$2]}' countries.tsv genomes_geolocation_new_9.tsv > genomes_geolocation_new_10.tsv
#delete header and add the columns lat and long
sed '1d' genomes_geolocation_new_10.tsv > genomes_geolocation_new_11.tsv
sed  -i '1i ID Country__autocolour Continent__autocolour Latitude Longitude' genomes_geolocation_new_11.tsv
#separate the columns with ';' -request with microreact
tr ' ' ';' < genomes_geolocation_new_11.tsv > genomes_geolocation_new_12.tsv
#make a new file ready to be uploaded in microreact
cp genomes_geolocation_new_12.tsv genomes_geolocation.tsv

rm genomes_geolocation_*



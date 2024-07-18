# download t2t assembly fasta
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/009/914/755/GCF_009914755.1_T2T-CHM13v2.0/GCF_009914755.1_T2T-CHM13v2.0_genomic.fna.gz
echo -e "name,genome_filename,protein_filename\nCHM13v2,GCF_009914755.1_T2T-CHM13v2.0_genomic.fna.gz," > genome_path.csv
sourmash scripts manysketch genome_path.csv -c 1 -p k=51,scaled=1000,abund -o CHM13v2.zip 
unzip CHM13v2.zip
gunzip signatures/ea61ead17f19b102f068377c96c3f62c.sig.gz
mv signatures/ea61ead17f19b102f068377c96c3f62c.sig CHM13v2.sig
rm -rf signatures CHM13v2.zip SOURMASH-MANIFEST.csv GCF_009914755.1_T2T-CHM13v2.0_genomic.fna.gz genome_path.csv
# downsample, just in case we need it
sourmash sig downsample CHM13v2.sig --scale 10000 -k 51 -o CHM13v2_s10k.sig


ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")# entering the NCBI accession version number of the interested sequence (sequences of Borrelia burgdorferi )
install.packages("rentrez")# installing the package rentrez
library(rentrez)# opening the package
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")# downloading data from NCBI databases, db represents the name of the database, id indicates the ID (NCBI accession number here) of interested sequence, and rettype represents the format of data. 
print(Bburg)
Sequences <- strsplit(gsub("(>+)","~\\1",Bburg),"~",)[[1]]# create a new object called Sequences that contains 3 elements
Sequences <- Sequences[which(Sequences!= "")]#removing first empty [1]
print(Sequences)
Sequences<-unlist(Sequences)
header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
Sequences<-data.frame(Name=header,Sequence=seq)
print(Sequences)
Seq1 <- gsub("\n","",Sequences$Sequence)#removing the newline characters
Sequences<-data.frame(Name=header,Sequence=Seq1)
print(Sequences)
write.csv(Sequences,"~/Desktop/Rentrez/Sequences.csv", row.names = FALSE) #saving into sequence.csv

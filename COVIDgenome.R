ncbi_ids <- c("NC_045512.2")
library(rentrez) 
nc<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")
print(nc)
nc1 <- gsub("\n","",nc)#removing the \n
sprotein <- gsub("\\w+(ATGTTTGTTTTTCTTGTTTTA\\w+GTCAAATTACATTACACATAA)\\w+","\\1",nc1)#extracting the s protein
nchar(nc3)
print(nc3)
#this gene is highly conserved becasue the identity percentage is 100% and have no gaps.
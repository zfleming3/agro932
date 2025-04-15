#Load genotype text generated from snp_calls.sh
geno <- read.table("geno.txt", header=FALSE)

#pull headder names and make a vector
names(geno) <- c("chr", "pos", "ref", "alt", "l1", "l2", "l3", "l4", "l5")

#Allele information
for(i in 5:9){
  # allele 1
  geno$newcol <- gsub("/.*", "", geno[,i] )
  # extract the line names
  nm <- names(geno)[i]
  # assign name for this allele
  names(geno)[ncol(geno)] <- paste0(nm, sep="_a1")
  geno$newcol <- gsub(".*/", "", geno[,i] )
  names(geno)[ncol(geno)] <- paste0(nm, sep="_a2")
}

#calculate p, p1, and p2
geno$p <- apply(geno[, 10:19], 1, function(x) {sum(as.numeric(as.character(x)))})
geno$p <- geno$p/10

geno$p1 <- apply(geno[, 10:15], 1, function(x) {sum(as.numeric(as.character(x)))})
geno$p1 <- geno$p1/6

geno$p2 <- apply(geno[, 16:19], 1, function(x) {sum(as.numeric(as.character(x)))})
geno$p2 <- geno$p2/4

#calculate fst
geno$fst <- with(geno, ((p1-p)^2 + (p2-p)^2)/(2*p*(1-p)) )

#write output table
write.table(geno, "fst.csv", sep=",", row.names = FALSE, quote=FALSE)

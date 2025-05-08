#set working directory and set up libraries
setwd("/work/agro932/zfleming3/agro932/Assignment_2/data")
#install.packages("data.table")
library("data.table")


## read in data (.gff file)
gff <- fread("Zea_mays.Zm-B73-REFERENCE-NAM-5.0.60.chr.gff3", skip = "#", fill = TRUE, header = FALSE, data.table = FALSE)
gff <- fread(cmd='grep -v "#" Zea_mays.Zm-B73-REFERENCE-NAM-5.0.60.chr.gff3', header=FALSE, data.table=FALSE)

#troubleshoot column names
##colnames(gff)
# Assign column names manually
colnames(gff) <- c("seqid", "source", "feature", "start", "end", "score", "strand", "phase", "attributes")

# subset gff into genes
g <- subset(gff, feature %in% "gene")
g$geneid <- gsub(".*gene:|;biotype.*", "", g$att)

#call genes on the + strand
gp <- subset(g, strand %in% "+")

### get the 5k upstream of the + strand gene model
gp_up <- gp
gp_up$end <- gp_up$start - 1
gp_up$start <- gp_up$end - 5000
### get the 5k downstream of the + strand gene model
gp_down <- gp
gp_down$start <- gp_down$end + 1
gp_down$end <- gp_down$start + 5000

### - strand
gm <- subset(g, strand %in% "-")
dim(gm) # 82
#output gene list
fwrite(g, "B73_gene.txt", sep="\t", row.names = FALSE, quote=FALSE)


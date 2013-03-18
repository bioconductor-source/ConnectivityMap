#-------------------------------------------------------------------------------
# two files are provided by the Broad's cmap project.  Bioconductor has
# permission to download and redistribute rankedMatrix.txt, and by extension
# (I assume) the metadata table which describes each column in the rankedMatrix.
#
# From: 	Aravind Subramanian <aravind@broadinstitute.org>
# Subject: 	Re: permission for Bioconductor to distribute cmap02 data + MSigDB
# Date: 	November 30, 2012 3:10:40 PM PST
# To: 	Paul Shannon <pshannon@fhcrc.org>
# Cc: 	Clare Pacini <pacini@ebi.ac.uk>
#  
# Paul,
# 
# Please go ahead — you can include the CMap build 02 dataset in your R
# package and occasionally we might ping you asking for download stats
# so that we can report to grant agencies. This applies only to the CMap
# build 02 and other versions might have different licensing rules
# (usually these are based on who funds the work).
# 
# Good luck!
# 
# aravind
#-------------------------------------------------------------------------------
PATH_TO_DOWNLOADED_CMAP02_DATA <- "/Users/pshannon/s/data/public/human/broad/cmap02"
MATRIX_FILE <- "rankMatrix.txt"
INSTANCES_FILE <- "cmap_instances_02.txt"
#-------------------------------------------------------------------------------
build <- function(destination.dir)
{
       # make sure the destination.dir makes sense

    testing.device <- file.path(destination.dir, "../data")
    stopifnot(file.exists(testing.device))
    parseAndSaveMetadata(destination.dir)
    parseAndSaveRankMatrix(destination.dir)

} # build
#-------------------------------------------------------------------------------
parseAndSaveRankMatrix <- function(destination.dir)
{
    path <- file.path(PATH_TO_DOWNLOADED_CMAP02_DATA, MATRIX_FILE)
    m <- read.table(path,header=TRUE, as.is=TRUE)

       # move the first column in rownames
    rownames(m) <- m$probe_id
    m <- m[,-1]

       # fix the column names, which start as integers, gain a prepended "X"
       # are better off with that X replaced by "inst_", short for
       # cmap's concept of "instance" which is what these numbers represent.
       # they point to entries in the metadata file
    
    trimmed.colnames <- sub("X", "", colnames(m))
    colnames(m) <- paste("inst", trimmed.colnames, sep="_")
    rankMatrix <- m
    output.file <- file.path(destination.dir, "rankMatrix.RData")
    save(rankMatrix, file=output.file)

} # parseAndSaveRankMatrix
#-------------------------------------------------------------------------------
parseAndSaveMetadata <- function(destination.dir)
{
    path <- file.path(PATH_TO_DOWNLOADED_CMAP02_DATA, INSTANCES_FILE)
    instances <- read.table(path, sep="\t", header=TRUE, as.is=TRUE, quote="", fill=TRUE)

       # ensure that rownames(instances) are the same as
       # colnames(rankMatrix)
    
    rownames(instances) <- paste("inst", instances$instance_id, sep="_")

       # remove that column
    instances <- instances[,-1]

    output.file <- file.path(destination.dir, "instances.RData")
    save(instances, file=output.file)

} # parseAndSaveMetadata
#-------------------------------------------------------------------------------

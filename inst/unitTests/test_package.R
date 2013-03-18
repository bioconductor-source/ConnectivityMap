library(ConnectivityMap)
library(RUnit)
#-------------------------------------------------------------------------------
runTests <- function()
{
    test_rankMatrix()
    test_instances()

} # runTests
#-------------------------------------------------------------------------------
test_rankMatrix <- function()
{
    print("--- test_rankMatrix")
    data(rankMatrix)
    checkEquals(dim(rankMatrix), c(22283, 6100))
    checkEquals(rownames(rankMatrix)[1:3], c("1007_s_at", "1053_at", "117_at"))
    checkEquals(head(colnames(rankMatrix)), c("inst_1", "inst_2", "inst_3", "inst_4", "inst_21","inst_22"))
    
} # test_rankMatrix
#-------------------------------------------------------------------------------
test_instances <- function()
{
    print("--- test_instances")
    data(instances)
    checkEquals(dim(instances), c(6100,14))
    checkEquals(colnames(instances),
                c("batch_id", "cmap_name", "INN1", "concentration..M.",
                  "duration..h.", "cell2", "array3", "perturbation_scan_id",
                  "vehicle_scan_id4", "scanner", "vehicle", "vendor",
                  "catalog_number", "catalog_name"))


        # inasmuch as instances provide metadata for rankMatrix
        # its rownames should exactly match the rankMatrix colnames
    
    data(rankMatrix)
    checkEquals(rownames(instances), colnames(rankMatrix))
    
} # test_instances
#-------------------------------------------------------------------------------


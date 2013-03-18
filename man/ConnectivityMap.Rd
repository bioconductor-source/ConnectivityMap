\name{ConnectivityMap}
\docType{data}
\alias{ConnectivityMap}
\alias{rankMatrix}
\alias{instances}

\title{ConnectivityMap: Functional connections between drugs, genes and
diseases as revealed by common gene-expression changes}

\description{

  The Broad Institute's Connectivity Map (cmap02)
  \url{http://www.broadinstitute.org/cmap/}
  
is a "large reference catalogue of gene-expression data from cultured human cells perturbed
with many chemicals and genetic reagents", containing more than 7000
gene expression profiles and 1300 small molecules.  Quoting further:

To pursue a systematic approach to the discovery of functional
connections among diseases, genetic perturbation, and drug action, we
have created the first installment of a reference collection of
gene-expression profiles from cultured human cells treated with
bioactive small molecules, together with pattern-matching software to
mine these data. We demonstrate that this "Connectivity Map" resource
can be used to find connections among small molecules sharing a
mechanism of action, chemicals and physiological processes, and diseases
and drugs. These results indicate the feasibility of the approach and
suggest the value of a large-scale community Connectivity Map project.

This data package contains two data objects, obtained with permission
from the Broad Institute, transformed very modestly, and presented
as serialied \emph{RData} objecgs:

\itemize{
  \item \emph{rankMatrix}: 22283 rows (human Affymetrix probeIDs) x 6100 perturbation "instances"
  \item \emph{instances}: 14 columns of metadata describing each of the 6100 instances.
  }


The metadata matrix, \emph{instances} has these columns:
\itemize{
  \item instance_id
  \item batch_id
  \item cmap_name
  \item INN1
  \item concentration (M)  (appears as "conentration..M.")
  \item duration (h)       (appears as "duration..h.")
  \item cell2
  \item array3
  \item perturbation_scan_id
  \item vehicle_scan_id4
  \item scanner
  \item vehicle
  \item vendor
  \item catalog_number
  \item catalog_name
} %% itemize
  
} %% description


\references{

Lamb, Justin, et al. "The Connectivity Map: using gene-expression
signatures to connect small molecules, genes, and disease." Science
Signalling 313.5795 (2006): 1929.

Lamb, Justin. "The Connectivity Map: a new tool for biomedical
research." Nature Reviews Cancer 7.1 (2007): 54-60.
}

\examples{
library(ConnectivityMap)
data(rankMatrix)
data(instances)
print(table(instances$cell2))
   # identify the pertubrations in the rankMatrix from the SKMEL5 skin
   # melanoma cell line
skmel.instance.names <- rownames(subset(instances, cell2=="SKMEL5"))
matrix.skmel <- rankMatrix[, skmel.instance.names]
}
\keyword{datasets}

#how to find specific genes in the plot

spikedin <- colnames(pData(spikein95))
spikedIndex <- match(spikedin,featureNames(mas5.eset))
points(a[spikedIndex], d[spikedIndex], pch=19, col="red")

#pdata creates access to phenotype data, but columns are probe IDS
#colnames allows you to have column names of pdata. 
#then you make the names into an object called "spikedin"

#to find ERalpha in the plot you look for ID on google using affy 

ESR1 <- "211233_x_at_1"
spikedIndex <- match(ESR1,featureNames(mas5.eset))

#made an object
genes_of_interest <- c("100_g_at", "1000_at", "1002_f_at")

#match takes genes of interest that you specified in object to whatever is in the dataset. 

#featureNames(mas5.eset) gives you all the IDS, mas5.eset is normalize data set. 

points(a[spikedIndex], d[spikedIndex], pch=19, col="red")
#a is x axis of MA plot ()
#d is the y axis of MA pot (rowmeans of half your experimental - row means of normal)


genes_of_interest <- c("100_g_at", "1000_at", "1002_f_at")
spikedIndex <- match(genes_of_interest,featureNames(mas5.eset))
> points(a[spikedIndex], d[spikedIndex], pch=19, col="green")

#RMA normalization, robust multichip robust normalization. Weizmann institute GeneAnnot website is useful. Can search affy ids. 
rma.eset <- rma(spikein95)
rma.e <- exprs(rma.eset)

#make MA plot 
d <- rowMeans(rma.e[,1:3]) - rowMeans(rma.e[,4:6])
> a <- rowMeans(rma.e)
> plot(a, d, ylim = c(-2, 2), main = "RMA MA plot", xlab = "A", ylab = "M", pch = ".")
> abline(h = c(-1, 1))

#make volcano plot 
library("genefilter")
> pData(rma.eset) <- pData(mas5.eset)
> tt <- rowMeans(rma.e)
> lod <- tt
> plot(d, lod, cex = 0.25, main = "Volcano plot", xlim = c(-2, 2), xlab = "M", ylab = "A", yaxt = "n")
> axis(2, at = seq(0, 3, by = 1), labels = 10^(-seq(0, 3, by = 1)))
> points(d[spikedIndex], lod[spikedIndex], pch = 19, col = "red")
> abline(h = 2, v = c(-1, 1))
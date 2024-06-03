library(gplots)

#Data Set Up
data_frame_matrix <- as.matrix(data_frame)

#Heatmap
breaks <- unique(c(seq(-5,-2,length=100),seq(-1.9,1.9,length=100), seq(2,5,length=100)))
my_palette <- colorRampPalette(c("blue","white","white","red"))(length(breaks)-1)

#Basic HeatMap
heatmap.2(df,
          Colv = NA,
          col=my_palette,
          breaks=breaks,
          density.info="none",
          trace="none",
          #main = "199 compounds; Length or Prev",
          symm=F,symkey=F,symbreaks=T,
          labRow = "",
          dendrogram = "row",
          labCol= "",
          cexCol = 1.2,
          cexRow = 1.2,
          margins = c(7,10),
          key.title = "Z-Scores" , key.xlab="Z_Score",)

#More Complex HeatMap With Clustering
heatmap.2(all_matrix,
          Rowv = T,
          Colv = F,
          col=my_palette,
          breaks=breaks,
          density.info="none",
          trace="none",
          #main = "199 compounds; Length or Prev",
          dendrogram=c("both"), 
          symm=F,symkey=F,symbreaks=T,
          labRow= F,
          labCol= colnames(all_matrix),
          cexCol = 1.5,
          cexRow = 0.8,
          margins = c(7,15),
          key.title = "1" , key.xlab="Standard Score", 
          #rowsep =c(0,4,12,19,31,37,43),
          #colsep =c(0,233),
          sepcolor = c("black"),sepwidth = c(0.05, 0.05),
          #ColSideColors=condition_colors, scale="none",
          distfun = function(x) dist(x, method = "euclidean"),
          hclust=function(x) hclust(x,method="ward.D2"))
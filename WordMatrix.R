library(wordcloud)
library(RMeCab)

#docmatrixの作成
matrix <-docMatrix("./title", pos=c("名詞", "動詞", "形容動詞", "形容詞"),weight="tf") 
matrix.dataframe <- as.data.frame(matrix)
head(matrix.dataframe)

#記号や数字などのいらないデータを削除
#削除する行数はその都度、変えてください
matrix.dataframe <- matrix.dataframe[305:length(matrix.dataframe$"2014-01-29titleList.csv"),]

#単語の合計・最大・最小・平均・最大と最小の列の差を追加
sum <- apply(matrix.dataframe, 1, sum)
min <- apply(matrix.dataframe, 1, min)
max <- apply(matrix.dataframe, 1, max)
mean <- apply(matrix.dataframe, 1, mean)
matrix.dataframe <- cbind(matrix.dataframe,sum,min,max,mean)
diff <- matrix.dataframe$max　-　matrix.dataframe$min
matrix.dataframe <- cbind(matrix.dataframe,diff)

#差について降順ソートして50件抽出
matrix.dataframe <- matrix.dataframe[order(matrix.dataframe$diff,decreasing=TRUE),]
diff.v <- row.names(matrix.dataframe[1:50,])

#平均についてソートして50件抽出
matrix.dataframe <- matrix.dataframe[order(matrix.dataframe$mean,decreasing=TRUE),]
mean.v <- row.names(matrix.dataframe[1:50,])

#平均と差の和集合を取得
intersect(diff.v ,mean.v)

#平均と差の差集合を取得
is.element(diff.v , mean.v)
id <- (50:1)%/%10
anomaly <- as.data.frame(cbind(diff.v, is.element(diff.v , mean.v), id))
anomaly <- subset(anomaly,anomaly$V2 == FALSE)



library(rjson)
library(RCurl)
library(stringr)

titleList <- c()

today <- Sys.Date();

#明日の番組表を取得する場合は＋１する
#today <- today +1
URL <- str_c("http://api.nhk.or.jp/v1/pg/list/130/g1/",today,".json?key={YOUR_API_KEY_STRING}",seq="")
programList <- getURL(URL)
programList.json <- fromJSON(programList)
for (i in 1:length(programList.json$list$g1)) {             
  titleList <- c(titleList,programList.json$list$g1[[i]]$title)            
}

URL <- str_c("http://api.nhk.or.jp/v1/pg/list/130/g2/",today,".json?key={YOUR_API_KEY_STRING}",seq="")
programList <- getURL(URL)
programList.json <- fromJSON(programList)
for (i in 1:length(programList.json$list$g2)) {             
  titleList <- c(titleList,programList.json$list$g2[[i]]$title)            
}

URL <- str_c("http://api.nhk.or.jp/v1/pg/list/130/e1/",today,".json?key={YOUR_API_KEY_STRING}",seq="")
programList <- getURL(URL)
programList.json <- fromJSON(programList)
for (i in 1:length(programList.json$list$e1)) {             
  titleList <- c(titleList,programList.json$list$e1[[i]]$title)            
}

URL <- str_c("http://api.nhk.or.jp/v1/pg/list/130/e2/",today,".json?key={YOUR_API_KEY_STRING}",seq="")
programList <- getURL(URL)
programList.json <- fromJSON(programList)
for (i in 1:length(programList.json$list$e2)) {             
  titleList <- c(titleList,programList.json$list$e2[[i]]$title)            
}

URL <- str_c("http://api.nhk.or.jp/v1/pg/list/130/e3/",today,".json?key={YOUR_API_KEY_STRING}",seq="")
programList <- getURL(URL)
programList.json <- fromJSON(programList)
for (i in 1:length(programList.json$list$e3)) {             
  titleList <- c(titleList,programList.json$list$e3[[i]]$title)            
}




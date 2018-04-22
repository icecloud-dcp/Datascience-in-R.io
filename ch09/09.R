## p.228 (3) ������ġ������ȸ������ ���� API Ȱ��

# �뼱 ���� ��ȣ�� ���� ���� ��� ID Ȯ��
install.packages("XML")
library(XML)
# API Ű
# API_key <- "DEp3%2BU.....DQ%3D%3D"
bus_No <- "402"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
xmlfile <- xmlParse(url)
xmltop <- xmlRoot(xmlfile)
xmltop

# �뼱 ID�� ���� ���� �ǽð� ��ġ Ȯ��
# install.packages("XML")
# library(XML)
# API Ű
# API_key <- "DEp3%2BU.....DQ%3D%3D"
busRouteId <- "100100063"
url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="")
xmlfile <- xmlParse(url)
xmltop <- xmlRoot(xmlfile)
xmltop

# �뼱 ���� ��ȣ�� ���� ���� ��� ID Ȯ��
# install.packages("XML")
# library(XML)
# API Ű
# API_key <- "DEp3%2BU.....DQ%3D%3D"
bus_No <- "402"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url)
top <- xmlRoot(doc)
top

df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df

busRouteId <- df$busRouteId
busRouteId

# �뼱 ID�� ���� ���� �ǽð� ��ġ ���� Ȯ��
url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="")
doc <- xmlParse(url)
top <- xmlRoot(doc)
top

df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df

# ���� �ʿ� ���� ��ġ ���
df$gpsX <- as.numeric(as.character(df$gpsX))
df$gpsY <- as.numeric(as.character(df$gpsY))
gc <- data.frame(lon=df$gpsX, lat=df$gpsY)
gc

cen <- c(mean(gc$lon), mean(gc$lat))
map <- get_googlemap(center=cen, maptype="roadmap",zoom=12, marker=gc)
ggmap(map, extent="device")
            
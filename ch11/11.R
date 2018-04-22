## p.281 (3) Ư�� �� �������� ��ǰ ���� ��ũ����

# �� ��ũ���� URL
library(XML)
url <- "http://www.coupang.com/np/search?q=%EC%97%AC%EC%84%B1%ED%81%AC%EB%A1%9C%EC%8A%A4%EB%B0%B1"
doc <- htmlParse(url, encoding="UTF-8")

# ���� ��ǰ ������ �ҽ� ���濡 ����, ��ǰ�� �˻� ��� ���� 
# prod_name <- xpathSApply(doc, "//ul[@id='productList']//dd[@class='name']", xmlValue) 
prod_name <- xpathSApply(doc, "//ul[@id='productList']//div[@class='name']", xmlValue) 
prod_name
prod_name <- gsub('\n', '', prod_name)
# ���� ��ǰ ������ �ҽ� ���濡 ����, '\t'(�� Ű) �߰� ����
prod_name <- gsub('\t', '', prod_name)

prod_name <- gsub(' ', '', prod_name)
prod_name

price     <- xpathSApply(doc, "//ul[@id='productList']//strong[@class='price-value']", xmlValue)
price

df <- data.frame(��ǰ��=prod_name, ����=price) 
df

df$��ǰ�� <- format(df$��ǰ��, justify = "left")
df

## p.286 (4) �ټ� �� �������� ��ǰ ���� ��ũ����

# �� ��ũ���� URL
# library(XML)
url <- "http://www.coupang.com/np/search?q=%EC%97%AC%EC%84%B1%ED%81%AC%EB%A1%9C%EC%8A%A4%EB%B0%B1&channel=user&component=&eventCategory=SRP&sorter=&minPrice=&maxPrice=&priceRange=&filterType=&listSize=36&filter=&filterKey=&isPriceRange=false&brand=&rating=0&page="

df.products <- NULL

for (page in 1:10) {
    url2 <- paste(url, page, sep="") 
    doc <- htmlParse(url2, encoding="UTF-8")
    # ���� ��ǰ ������ �ҽ� ���濡 ����, ��ǰ�� �˻� ��� ���� 
    # prod_name <- xpathSApply(doc, "//ul[@id='productList']//dd[@class='name']", xmlValue) 
    prod_name <- xpathSApply(doc, "//ul[@id='productList']//div[@class='name']", xmlValue) 
    prod_name <- gsub('\n', '', prod_name)
    # ���� ��ǰ ������ �ҽ� ���濡 ����, '\t'(�� Ű) �߰� ����
    prod_name <- gsub('\t', '', prod_name)
	
    prod_name <- gsub(' ', '', prod_name)
    price     <- xpathSApply(doc, "//ul[@id='productList']//strong[@class='price-value']", xmlValue)
    df <- data.frame(��ǰ��= prod_name, ����=price) 
    df.products <- rbind(df.products, df) 
}
df.products

df.products$��ǰ�� <- format(df.products$��ǰ��, justify = "left")
df.products
     
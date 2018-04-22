## p.156 (2) �ִϸ��̼� 1: ī��Ʈ �ٿ�

# ���� ���: ī��Ʈ �ٿ�
library(animation)
ani.options(interval = 1)
 
for (i in 10:0) {
    plot.new()
    rect(0, 0, 1, 1, col="yellow")
    size = 11-i
    text(0.5, 0.5, i, cex=size, col=rgb(0,0,1,1)) 
    ani.pause()
}

## p.162 (3) �ִϸ��̼� 2: �����̴� ��Ʈ

library(animation)
ani.options(interval = 1)
while(TRUE) {
    y <- runif(5, 0, 1)
    barplot(y, ylim = c(0, 1), col=rainbow(5))
    ani.pause()
}

## p.164 (4) �ִϸ��̼� 3: �����̴� �׸�
# �������� ��
library(animation)
library(png)
ani.options(interval = 0.5)
for (i in 1:6) {
    img <- paste("C://temp/ball", i, ".png", sep="")
    img <- readPNG(img)
    plot.new()
    rect(0, 0, 1, 1, col="white")
    rasterImage(img, 0, 0, 1, 1)
    ani.pause()
}
dev.off()
        
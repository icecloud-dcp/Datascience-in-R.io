## p.355 (2) ���� ������

# ������ 5,000�� ���� �� ���� Ƚ���� ���� �ո��� ������ Ȯ���� ��ȭ
iteration <- 5000
plot(0, 0, xlab="������ ���� ȸ��", ylab="�ո��� ������ ����", xlim=c(0, iteration), ylim=c(0, 1)) 

abline(a=0.5, b=0, col="red") 

sum <- 0
for(x in 1:iteration) {
 
    coin <- sample(c("�ո�", "�޸�"), 1, replace=T)
    
    if (coin == "�ո�")
        sum = sum + 1 

    prob <- sum / x
    
    points(x, prob)
}

# ������ 5,000�� ���� �� �ո��� ���� Ƚ��
# ���� Ƚ��: 5000
iteration <- 5000
x <- sample(c(0, 1), iteration, replace=T)
round(sum(x)/iteration * 100, 1)

## p.362 (3) ����ī���� �ùķ��̼ǿ� ���� ������ ���ϱ�

# ������ ���
iteration <- 1000
n_circle <- 0
for(i in 1: iteration) {
    x <- runif(1, min=0, max=1)
    y <- runif(1, min=0, max=1)
    dist <- sqrt(x^2 + y^2)
    if (dist <= 1)
        n_circle <- n_circle + 1
}
pi <- 4 * n_circle/iteration
pi
       
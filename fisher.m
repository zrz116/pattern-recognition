load data
b1 = boydatas(1:500, 1:2);
b2 = boydatas(501:1000, 1:2);
b = [b1;b2];
test = boydatatest;
m_b1 = mean(b1)';
m_b2 = mean(b2)';
S1 = zeros(2);
for i = 1:size(b1, 1)
    S1 = S1+(b1(i, :)'-m_b1)*(b1(i, :)'-m_b1)';
end
S2 = zeros(2);
for i = 1:size(b2, 1)
    S2 = S2+(b2(i, :)'-m_b2)*(b2(i, :)'-m_b2)';
end
Sw = S1+S2;
%投影向量的计算
w = inv(Sw)*(m_b1-m_b2);
%计算投影后的一维空间内各类的均值
dim1_m1 = w'*m_b1;
dim1_m2 = w'*m_b2;
%计算阈值w0
w0 = (-1/2)*(dim1_m1+dim1_m2);
plot(b1(:,1),b1(:,2),'r.');
hold on
plot(b2(:,1),b2(:,2),'b*');
x = [-5:0.1:16];
y = w(1)/w(2)*x;

plot(x,y)
%测试
for i = 1:600
    t(i) = test(i, :)*w;
    if t(i)+w0>0
        t(i) = 1;
    else
        t(i) = 0;
    end
end
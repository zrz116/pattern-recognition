load data
x1 = boydatas(1:500, 1:2);
x2 = boydatas(501:1000, 1:2);
a=[ones(500,1),x1];
b=[ones(500,1),x2];
%�����������
Y=[a;-b];
%���ó�������b
B=ones(1000,1);      
N=inv(Y'*Y);
alpha=N*Y'*B;
plot(x1(:,1),x1(:,2),'r.');
hold on
plot(x2(:,1),x2(:,2),'b*');
x=-2:0.1:12;
y=-alpha(1)/alpha(3)-x*alpha(2)/alpha(3);
plot(x,y);
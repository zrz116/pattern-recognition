load data
%加载训练数据集
x1 = boydatas(1:500, 1:2)';
x2 = boydatas(501:1000, 1:2)';
x = [x1, x2];
y = boydatas(:, 3);
plot(x1(1, :), x1(2, :), 'rs');
hold on
plot(x2(1, :), x2(2, :), 'go');
hold on
title('training data');
legend('class 1', 'class 2', 'Location', 'NorthEast');

%加载测试数据集
x1t = boydatatest(1:300, :)';
x2t = boydatatest(301:600, :)';
xt = [x1t, x2t];
yt = zeros(1, 600);
figure(2)
plot(x1t(1, :), x1t(2, :), 'rs');
hold on
plot(x2t(1, :), x2t(2, :), 'go');
hold on
title('testing data');
legend('class 1', 'class 2', 'Location', 'NorthEast');
%进行测试，输出h为测试结果的类别
h = BayesError(x1, x2, xt, yt);
%将测试结果可视化
x_1 = xt(:,h==1);
x_0 = xt(:,h==0);

plot(x_1(1, :), x_1(2, :), 'r.');
hold on
plot(x_0(1, :), x_0(2, :), 'g.');
hold on
%贝叶斯分类函数
function h = BayesError(x1_train, x2_train, x_test, y)
    %计算训练集的均值和方差
    mu1 = mean(x1_train, 2);
    sigma1 = cov(x1_train');
    p1 = 0.5;
    mu2 = mean(x2_train, 2);
    sigma2 = cov(x2_train');
    p2 = 0.5;
    %加载新样本，计算每个测试样本点和训练样本集的均值的距离，比较测试样本点在哪个类别的概率最大
    bias = 0.5*log(det(sigma2))-0.5*log(det(sigma1))+log(p1/p2);
    h = size(y);
    for i = 1:600
        c = bias + 0.5*(x_test(:, i)-mu2)'/sigma2*(x_test(:, i)-mu2) - 0.5*(x_test(:, i)-mu1)'/sigma1*(x_test(:, i)-mu1);
        if c>0
            h(i) = 1;
        else
            h(i) = 0;
        end
        
    end
end


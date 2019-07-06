load data
%����ѵ�����ݼ�
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

%���ز������ݼ�
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
%���в��ԣ����hΪ���Խ�������
h = BayesError(x1, x2, xt, yt);
%�����Խ�����ӻ�
x_1 = xt(:,h==1);
x_0 = xt(:,h==0);

plot(x_1(1, :), x_1(2, :), 'r.');
hold on
plot(x_0(1, :), x_0(2, :), 'g.');
hold on
%��Ҷ˹���ຯ��
function h = BayesError(x1_train, x2_train, x_test, y)
    %����ѵ�����ľ�ֵ�ͷ���
    mu1 = mean(x1_train, 2);
    sigma1 = cov(x1_train');
    p1 = 0.5;
    mu2 = mean(x2_train, 2);
    sigma2 = cov(x2_train');
    p2 = 0.5;
    %����������������ÿ�������������ѵ���������ľ�ֵ�ľ��룬�Ƚϲ������������ĸ����ĸ������
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


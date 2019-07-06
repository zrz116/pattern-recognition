load data
x = boydatatest(:, 1:2);
y = [ones(300, 1)', -ones(300, 1)']';
w = [1, 1];
lr = 0.25;
k = 0;
b = 1;
flag = 1;
while(flag==1)
    for i = 1:600
        if(y(i, :)*(w*x(i, :)'+b))<=0
            k = k + 1;
            w = w + lr*y(i, :)*x(i, :);
            b = b + lr*y(i, :);
            break;
        else
            if(i==600)
                flag=0;
            end
        end
    end
end


plot(x(1:300, 1), x(1:300, 2), 'r.');
hold on
plot(x(301:600, 1), x(301:600, 2), 'b*');
X = [-5:0.01:16]; 
Y = -w(1)*X/w(2)-b/w(2);
plot(X, Y);
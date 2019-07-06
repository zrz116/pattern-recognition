load data
n = 500;
x1 = boydatas(1:500, 1);
x2 = boydatas(1:500, 2);
y1 = boydatas(501:1000, 1);
y2 = boydatas(501:1000, 2);
x = [x1 x2];
y = [y1 y2];
max_x1 = max(x1);
min_x1 = min(x1);
max_x2 = max(x2);
min_x2 = min(x2);
max_y1 = max(y1);
min_y1 = min(y1);
max_y2 = max(y2);
min_y2 = min(y2);
dx1 = (max_x1-min_x1)/n;
dx2 = (max_x2-min_x2)/n;
dy1 = (max_y1-min_y1)/n;
dy2 = (max_y2-min_y2)/n;
X1 = 0;  %横坐标
X2 = 0;  %纵坐标
h = 1;  %假设小立方体的变长为0.5
k = 0;  %初始化均匀核函数为0


for Xx1 = min_x1:0.1:max_x1
    X1 = X1+1;
    for Xx2 = min_x2:0.1:max_x2
        X2 = X2+1;
        P(X1, X2) = 0;
        for i = 1:n
            if abs(x(i, :)-[Xx1, Xx2])/h <= 1/2
                k = k+1;
                P(X1, X2) = P(X1, X2) + k/n/h;
                k = 0;
            end
        end
    end
    X2 = 0;
end
surf(P)

        


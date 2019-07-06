
load data
n = 500;
x1 = boydatas(1:500, 1);
x2 = boydatas(1:500, 2);
x = [x1 x2];
y1 = boydatas(501:1000, 1);
y2 = boydatas(501:1000, 2);
y = [y1 y2];
max_x1 = max(x1);
min_x1 = min(x1);
max_x2 = max(x2);
min_x2 = min(x2);
max_y1 = max(y1);
min_y1 = min(y1);
max_y2 = max(y2);
min_y2 = min(y2);

h = 1;
X1 = 0;
X2 = 0;
for Xx1 = min_x1:0.1:max_x1
    X1 = X1+1;
    for Xx2 = min_x2:0.1:max_x2
        X2 = X2+1;
        P(X1, X2) = 0;
        for i = 1:n
            P(X1, X2) = P(X1, X2)+ exp(-(((x(i, 1)-Xx1).^2+(x(i, 2)-Xx2).^2)/2/h))/sqrt(2*pi)/n/h;
                
            
                
            
        end
    end
    X2 = 0;
end



figure(1)
mesh(P);



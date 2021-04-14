function [P1YC, P2YC, P12YC] = decode(n,X1,X2,Y1,Y2)%n:X1,X2 length
X1C = 0;
X2C = 0;
X12C = 0;
for i =1:n
    if Y1(i)*X1 >= 0
        X1C=X1C+1;
    end
end
P1YC = X1C/n;

for i =1:n
    if Y2(i)*X2 >= 0
        X2C=X2C+1;
    end
end
P2YC = X2C/n;

for i =1:n
    if (Y1(i)*X1 >= 0)&&(Y2(i)*X2 >= 0)
        X12C=X12C+1;
    end
end
P12YC = X12C/n;
end


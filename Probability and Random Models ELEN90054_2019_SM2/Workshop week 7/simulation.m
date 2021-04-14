function [Pe] = simulation(p1,p2,p3,lamda,N,p)%p1 p2 p3:p of X1X2;N:length of X1,X2
%generate X1 X2
for i = 1:N
    r=rand(1);
    if r <= p1
        X1(i) = 1;
        X2(i) = 1;
    elseif r <= p1+p2
        X1(i) = -1;
        X2(i) = 1;
    elseif r <= p1+p2+p3
        X1(i) = -1;
        X2(i) = -1; 
    else
        X1(i) = 1;
        X2(i) = -1;
    end
end
u = rand(1,N);%generate uniform rv
R2 = -log(u)/lamda;%R2 f(u) are identically distributed
v = rand(1,N);%generate uniform rv
Theta = 2*pi*v;%Theta f(v) are identically distributed
R = sqrt(R2);
N1 = R.*cos(Theta);
N2 = R.*sin(Theta);
%(a)
Yr = X1+N1;%Y real part
Yi = X2+N2;%Y imagerary part
figure(p);
scatter(Yr(X1==1 & X2==1), Yi(X1==1 & X2==1),'.','r');%quadrant I
hold on;
scatter(Yr(X1==-1 & X2==1), Yi(X1==-1 & X2==1),'.','y');%quadrant II
hold on;
scatter(Yr(X1==-1 & X2==-1), Yi(X1==-1 & X2==-1),'.','b');%quadrant III
hold on;
scatter(Yr(X1==1 & X2==-1), Yi(X1==1 & X2==-1),'.','g');%quadrant IV
title('scatter plot of the y-values');
%(b)
n = find((Yr.*X1<0)|(Yi.*X2<0));%decode errors number
figure(p+1);
scatter(Yr(X1==1 & X2==1 & ((Yr.*X1<0)|(Yi.*X2<0))), Yi(X1==1 & X2==1 & ((Yr.*X1<0)|(Yi.*X2<0))),'.','r');%quadrant I
hold on;
scatter(Yr(X1==-1 & X2==1 & ((Yr.*X1<0)|(Yi.*X2<0))), Yi(X1==-1 & X2==1 & ((Yr.*X1<0)|(Yi.*X2<0))),'.','y');%quadrant II
hold on;
scatter(Yr(X1==-1 & X2==-1 & ((Yr.*X1<0)|(Yi.*X2<0))), Yi(X1==-1 & X2==-1 & ((Yr.*X1<0)|(Yi.*X2<0))),'.','b');%quadrant III
hold on;
scatter(Yr(X1==1 & X2==-1 & ((Yr.*X1<0)|(Yi.*X2<0))), Yi(X1==1 & X2==-1 & ((Yr.*X1<0)|(Yi.*X2<0))),'.','g');%quadrant IV
title('scatter plot of the y-values without all correctly detected y points');
%(c)
Pe = length(n)/N;%detector error probability
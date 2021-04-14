function [Pe] = newrule(p1,p2,p3,lamda,N)%p1 p2 p3:p of X1X2;N:length of X1,X2
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
n = find((Yr.*(X1+1/(1+lambda))<0)|(Yi.*(X2+1/(1+lambda))<0));%decode errors number
Pe = length(n)/N;%detector error probability
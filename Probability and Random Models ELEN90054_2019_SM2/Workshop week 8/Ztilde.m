function [Ztilde] = Ztilde(N,n)
for i = 1:N
u = rand(1,n);%generate uniform rv
Z = tan(pi*(u-1/2))+2;%X f(u) are identically distributed
Ztilde(i) = (sum(Z)-2*n)/sqrt(n);
end
end

function [Xtilde] = Xtilde(N,n)
for i = 1:N
u = rand(1,n);%generate uniform rv
X = 3*sqrt(u);%X f(u) are identically distributed
Xtilde(i) = (sum(X)-2*n)/sqrt(n);
end
end


function [Ytilde] = Ytilde(N,n)
for i = 1:N
u = rand(1,n);%generate uniform rv
Y = 1.25*(u<4/9) + 2*(4/9<=u&u<5/9) + 2.75*(5/9<=u);%X f(u) are identically distributed
Ytilde(i) = (sum(Y)-2*n)/sqrt(n);
end
end


clear all
close all
clc

%%output 2 means e(erased)
%% Part c
Yc = channel(1,1,0.2,0.05)%%n=1, p1=0.2, p2=0.05.

%% Part d
Yd = channel(0,99,0,0.05);%%The bit string is all 0, n=99, p1=0, p2=0.05.
k=0:99;
Pbino = binopdf(k,99,0.05);%%pmf of binomial
Ppois = poisspdf(k,4.95);%%pmf of poisson
figure(1);
stem(k,Pbino,'r');
hold on;
stem(k,Ppois,'k');
legend('exact pmf of binomial','approximation pmf of poisson');
xlabel('the number of occurring bit-swaps');
ylabel('pmf');

%% Part e
PYe = zeros(1,100);
for i=1:10000
y = channel(0,99,0,0.05);%%The bit string is all 0, n=99, p1=0.2, p2=0.05.
yn = length(find(y==1));%%Find the number of swaping.
PYe(yn+1) = PYe(yn+1)+1;%%Calculate the each number of times with different times of swaping.
end
PYe = PYe/10000;%%empirical pmf
k=0:99;
figure(2);
stem(k,PYe,'r');
hold on;
Pbino = binopdf(k,99,0.05);%%pmf of binomial
stem(k,Pbino,'k');
legend('empirical pmf','exact pmf of binomial');
xlabel('the number of occurring bit-swaps');
ylabel('pmf');

%% Part f
plotbitswaps(0.05,0.8,2,3);
plotbitswaps(0.05,0.8,5,3);
plotbitswaps(0.05,0.8,10,3);
plotbitswaps(0.05,0.8,100,3);
plotbitswaps(0.05,0.8,1000,3);
plotbitswaps(0.05,0.8,10000,3);
legend('M=2','M=5','M=10','M=100','M=1000','M=10000');
xlabel('p2');
ylabel('the empirical average number of bit-swaps that occur in n = 99');

%% Part h
plotempiricalerrors(99,0,0.45,10000,4); 

%% Prat i
plotempiricalerrors(5,0,0.45,10000,4);
legend('n=99','n=5');
xlabel('p2');
ylabel('the empirical average number of decoder errors');
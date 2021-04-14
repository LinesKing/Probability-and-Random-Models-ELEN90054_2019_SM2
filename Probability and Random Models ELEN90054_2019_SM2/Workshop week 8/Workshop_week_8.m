clear all
close all
clc

%% Q3
%(a)
for i = 1:5
u = rand(1,100000);%generate uniform rv
X = 3*sqrt(u);%X f(u) are identically distributed
Xt(i) = sum(X)/100000;
end

%% Q4
X3tilde = Xtilde(5000,3);%n = 3
figure(1);
cdfplot(X3tilde);
hold on;
P = normcdf(-10:0.01:10,0,sqrt(0.5));
plot(-10:0.01:10,P);
legend('X3tilde','normal','Location','best');
xlabel('Xtilde');
ylabel('CDF');
title('CDF of Xtilde when n = 3');

X10tilde = Xtilde(5000,10);%n = 10
figure(2);
cdfplot(X10tilde);
hold on;
P = normcdf(-10:0.01:10,0,sqrt(0.5));
plot(-10:0.01:10,P);
legend('X10tilde','normal','Location','best');
xlabel('Xtilde');
ylabel('CDF');
title('CDF of Xtilde when n = 10');

X100tilde = Xtilde(5000,100);%n = 100
figure(3);
cdfplot(X100tilde);
hold on;
P = normcdf(-10:0.01:10,0,sqrt(0.5));
plot(-10:0.01:10,P);
legend('X100tilde','normal','Location','best');
xlabel('Xtilde');
ylabel('CDF');
title('CDF of Xtilde when n = 100');

%% Q5
%(a)
for i = 1:5
u = rand(1,100000);%generate uniform rv
Y = 1.25*(u<4/9) + 2*(4/9<=u&u<5/9) + 2.75*(5/9<=u);%X f(u) are identically distributed
Yt(i) = sum(Y)/100000;
end

Y3tilde = Ytilde(5000,3);%n = 3
figure(4);
cdfplot(Y3tilde);
hold on;
P = normcdf(-10:0.01:10,0,sqrt(0.5));
plot(-10:0.01:10,P);
legend('Y3tilde','normal','Location','best');
xlabel('Ytilde');
ylabel('CDF');
title('CDF of Ytilde when n = 3');

Y10tilde = Ytilde(5000,10);%n = 10
figure(5);
cdfplot(Y10tilde);
hold on;
P = normcdf(-10:0.01:10,0,sqrt(0.5));
plot(-10:0.01:10,P);
legend('Y10tilde','normal','Location','best');
xlabel('Ytilde');
ylabel('CDF');
title('CDF of Ytilde when n = 10');

Y100tilde = Ytilde(5000,100);%n = 100
figure(6);
cdfplot(Y100tilde);
hold on;
P = normcdf(-10:0.01:10,0,sqrt(0.5));
plot(-10:0.01:10,P);
legend('Y100tilde','normal','Location','best');
xlabel('Ytilde');
ylabel('CDF');
title('CDF of Ytilde when n = 100');

%% Q6
x=-50:0.1:50;
figure(7);
plot(x,normcdf(x,0,sqrt(0.5)));
grid on;
title('Theoretical CDF of X');

y=-50:0.1:50;
figure(8);
plot(y,normcdf(y,0,sqrt(0.5)));
grid on;
title('Theoretical CDF of Y');
%% Q7
%(a)
for i = 1:5
u = rand(1,100000);%generate uniform rv
Z = tan(pi*(u-1/2))+2;%X f(u) are identically distributed
Zt(i) = sum(Z)/100000;
end

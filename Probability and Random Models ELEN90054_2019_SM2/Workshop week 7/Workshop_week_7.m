clear all
close all
clc

%% Q4
u = rand(1,30000);%generate uniform rv
R2 = -log(u);%R2 f(u) are identically distributed
r2 = 0:0.5:20;
Fr = 1- exp(-r2);
figure(1);
cdfplot(R2);
hold on;
plot(r2,Fr);
title('sample & exact CDF');
legend('sample CDF','exact CDF','Location','best');

%% Q5
N = 30000;
v = rand(1,N);%generate uniform rv
Theta = 2*pi*v;%Theta f(v) are identically distributed
R = sqrt(R2);
N1 = R.*cos(Theta);
N2 = R.*sin(Theta);
%(a)
figure(2);
scatter(N1(1:1000), N2(1:1000),'.');
%(b)
Y1 = -1+N1;
Y2 = 1+N2;
PXC = [0,0,0];
[PX1C,PX2C,PX12C] = decode(N,-1,1,Y1,Y2)
%PX1C: P(x1 is decoded correctly)
%PX2C: P(x2 is decoded correctly)
%PX12C: P(x1 and x2 are both decoded correctly)

%% Q6
cov = PX12C - PX1C*PX2C%if cov is close to 0, N1 N2 are independent.

%% Q7
cdfplot(N1);
hold on;
cdfplot(N2);
hold on;
P = normcdf(-10:0.01:10,0,sqrt(0.5));
plot(-10:0.01:10,P);
title('N1&N2 ditribution');
legend('N1','N2','normal','Location','best');
PN1 = normcdf(1/sqrt(0.5))%P(x1 is decoded correctly)
PN2 = normcdf(1/sqrt(0.5))%P(x2 is decoded correctly)

%% Q8
%(a)(b)(c)
[Pe8_1] = simulation(1/4,1/4,1/4,1,10000,3)%generate X1 X2 with same p=1/4, lamda=1, detector error probability
%(d)
[Pe8_0_5] = simulation(1/4,1/4,1/4,0.5,10000,5)%generate X1 X2 with same p=1/4, lamda=0.5, detector error probability
[Pe8_5] = simulation(1/4,1/4,1/4,5,10000,7)%generate X1 X2 with same p=1/4, lamda=5, detector error probability

%% Q9
%(a)(b)(c)
[Pe9_1] = simulation(3/4,1/12,1/12,1,10000,9)%generate X1 X2 with p=3/4,1/12,1/12,1/12, lamda=1, detector error probability
%(d)
[Pe9_0_5] = simulation(3/4,1/12,1/12,0.5,10000,11)%generate X1 X2 with p=3/4,1/12,1/12,1/12, lamda=0.5, detector error probability
[Pe9_5] = simulation(3/4,1/12,1/12,5,10000,13)%generate X1 X2 with p=3/4,1/12,1/12,1/12, lamda=5, detector error probability

[Pe9new_1] = simulation(3/4,1/12,1/12,1,10000,13)%decide a new rule repeat the Q9 above
[Pe9new_0_5] = simulation(3/4,1/12,1/12,0.5,10000,13)
[Pe9new_5] = simulation(3/4,1/12,1/12,5,10000,13)
%% Q10
%(a)(b)(c)
[Pe10_1] = simulation(1,0,0,1,10000,15)%generate X1 X2 with p=1,0,0,0, lamda=1, detector error probability
%(d)
[Pe10_0_5] = simulation(1,0,0,0.5,10000,17)%generate X1 X2 with p=1,0,0,0, lamda=0.5, detector error probability
[Pe10_5] = simulation(1,0,0,5,10000,19)%generate X1 X2 with p=1,0,0,0, 2, lamda=5, detector error probability

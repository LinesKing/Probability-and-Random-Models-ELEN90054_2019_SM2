clear all
close all
clc

%% Q4
% realisation I
tsum = 0;
i=1;
T=0;
while 1
    t = exprnd(4);
    tsum = tsum + t;
    if tsum > 60
        break;
    end
    T(i) = tsum;
    i = i + 1;
end
for i = 0:60
    Yt(i+1) = length(find(T<i));%sample array
end

% realisation II
j=1;
Ysum=0;
for i=1:60
    y = poissrnd(0.25);
    Ysum = Ysum + y;
    Ytt(i) = Ysum;
end

figure(1)
stairs(0:60,Yt);
hold on;
stairs(1:60,Ytt);
title('a sample array of visit times up to t = 60 minutes')
legend('realisation I','realisation II')
xlabel('t / min');
ylabel('Y / students');
grid on;
%% Q5
%(a)The total number of visits by (i) t = 20 (ii) t = 30, and (iii) t = 40
Yta1 = Simulation_1(20,1)
Yta2 = Simulation_1(30,1)
Yta3 = Simulation_1(40,1)
%(b)The number of visits between (i) t = 20 and t = 40, (ii) t = 30 and t = 50, and (iii) t = 40 and t = 60.
Ytb1 = Simulation_2(20,40)
Ytb2 = Simulation_2(30,50)
Ytb3 = Simulation_2(40,60)

%% Q6
%(a)PMF of Y (40)
Yt = Simulation_1(40,50000);
for i=0:30
    yd(i+1) = length(find(Yt==i))/50000;%empirical PMF
end
x = 0:30;
y = poisspdf(x,10);%true PMF
figure(2)
stem(0:30,yd);
hold on;
stem(x,y);
title('empirical and true PMF of Y (40)')
xlabel('k / students');
ylabel('pdf');
legend('empirical PMF','true PMF');
grid on;

%(b)empirical value of the probability q
Ytb_1 = Simulation_1(20,500000);
Ytb_2 = Simulation_1(20,500000);
q = length(find((Ytb_1 <= 3) & ((Ytb_1+Ytb_2) <= 5)))/500000

%(c)E[Y(t)] for each of t = 20, t = 30 and t = 40
EYtc20 = mean(Simulation_1(20,50000))
EYtc30 = mean(Simulation_1(30,50000))
EYtc40 = mean(Simulation_1(40,50000))

%(d)E[Y(t)Y(t + 10)] for t = 20 and for t = 30.
Y1 = Simulation_1(10,50000);
Y2 = Simulation_1(20,50000);
Y3 = Simulation_1(30,50000);
EYtd2030 = mean((Y2).*(Y1+Y2))
EYtd3040 = mean((Y3).*(Y1+Y3))

%% Q9
% (a)
%(I)average waiting time Q30 for 30 students
W1(1) = 0;
T1(1) = exprnd(4);
S1(1) = rand*0.7+0.3;
for n=2:30
    T1(n) = exprnd(4);
    S1(n) = rand*0.7+0.3;
    W1(n) = max(W1(n-1) + S1(n-1) - T1(n),0);
end
Q130 = mean(W1)

%(II)Plot Qn as a function of n (use 50,000 trials)
Q11(1) = 0;
T11 = exprnd(4,[1 50000]);
S11 = rand(1,50000)*0.7+0.3;
W11(1) = 0;
for m=2:50000
    for n=2:m
    W11(n) = max(W11(n-1) + S11(n-1) - T11(n),0);
    end
Q11(m) = mean(W11);
end
figure(3)
plot(1:50000,Q11);
title('average waiting time')
xlabel('n / students');
ylabel('Q');
grid on;

% (b)Repeat part a) for a = 2 and b = 5
%(I)
W2(1) = 0;
T2(1) = exprnd(4);
S2(1) = rand*3+2;
for n=2:30
    T2(n) = exprnd(4);
    S2(n) = rand*3+2;
    W2(n) = max(W2(n-1) + S2(n-1) - T2(n),0);
end
Q230 = mean(W2)

%(II)
Q22(1) = 0;
T22 = exprnd(4,[1 50000]);
S22 = rand(1,50000)*3+2;
W22(1) = 0;
for m=2:50000
    for n=2:m
    W22(n) = max(W22(n-1) + S22(n-1) - T22(n),0);
    end
Q22(m) = mean(W22);
end
figure(4)
plot(1:50000,Q22);
title('average waiting time')
xlabel('n / students');
ylabel('Q');
grid on;

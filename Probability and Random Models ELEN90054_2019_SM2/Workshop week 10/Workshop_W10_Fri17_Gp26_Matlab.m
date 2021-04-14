clear all
close all
clc

%% Q8(a)
reader = randi([0 1]);%0 means no faulty, 1 means faulty
if reader == 0%no faulty
    N = 1;
    flag0 = 0;%if the reader can open the door
    while flag0(N) < 0.98
          N = N+1;
          flag0(N) = rand;
    end
else%faulty
    N = 1;
    flag1 = 0;%if the reader can open the door
    while flag1(N) < 0.9
          N = N+1;
          flag1(N) = rand;
        end
    end
% Q5 decision
Flag5 = N<=24

% Q6 decision
Flag6= N<=39

%% Q8(b)
Reader = [ones(1,440000) zeros(1,1560000)];%0 means no faulty, 1 means faulty
[N,Flag5,Flag6] = simulation(Reader);

% Q5 decision
Pfar5 = length(find(Reader == 0 & xor(Reader,Flag5) == 1))/length(Reader)/0.78%false alarm rate
Pmiss5 = length(find(Reader == 1 & xor(Reader,Flag5) == 1))/length(Reader)/0.22%miss rate
Ecost5 = Pfar5*10*0.78 + Pmiss5*50*0.22%empirical values of the expected cost

% Q6 decision
Pfar6 = length(find(Reader == 0 & xor(Reader,Flag6) == 1))/length(Reader)/0.78%false alarm rate
Pmiss6 = length(find(Reader == 1 & xor(Reader,Flag6) == 1))/length(Reader)/0.22%miss rate
Ecost6 = Pfar6*10*0.78 + Pmiss6*50*0.22%empirical values of the expected cost

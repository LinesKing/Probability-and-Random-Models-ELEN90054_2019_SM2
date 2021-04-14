function [Yt] = Simulation_1(t,N)
for j=1:N
tsum = 0;
i=1;
T=0;
while 1
    r = exprnd(4);
    tsum = tsum + r;
    if tsum > t
        break;
    end
    T(i) = tsum;
    i = i + 1;
end
Yt(j) = i-1;%sample array
end
end

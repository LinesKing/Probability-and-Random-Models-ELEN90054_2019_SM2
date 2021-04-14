function [Yt] = Simulation_2(t1,t2)
tsum = 0;
i=1;
while 1
    t = exprnd(4);
    tsum = tsum + t;
    if tsum > 60
        break;
    end
    T(i) = tsum;
    i = i + 1;
end

Yt = length(find(T<t2))-length(find(T<t1));%sample array

end

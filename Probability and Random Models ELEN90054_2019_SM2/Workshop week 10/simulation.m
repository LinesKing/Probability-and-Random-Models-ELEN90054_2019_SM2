function [N,flag5,flag6] = simulation(reader)
N=0;
for j = 1:length(reader)
    if reader(j) == 0%no faulty
    i = 1;
    flag0 = 0;
    while flag0(i) < 0.98
          i = i+1;
          flag0(i) = rand;%if the reader can open the door
    end
    N(j) = i;
else%no faulty
    i = 1;
    flag1 = 0;
    while flag1(i) < 0.9
          i = i+1;
          flag1(i) = rand;%if the reader can open the door
        end
    N(j) = i;    
    end
end

% Q5 decision
flag5 = N<=24;

% Q6 decision
flag6= N<=39;

end


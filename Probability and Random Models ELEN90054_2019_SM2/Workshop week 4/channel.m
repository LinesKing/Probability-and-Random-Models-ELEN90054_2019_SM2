function [y] = channel(a,n,p1,p2)%%a is the up bound of range of rand, n is the length of the string, 
                                 %%p1 is the probability of erasing, p2 is the probability of swap.
for t=1:n
X = randi([0 a]);%%input
chnl = rand([1]);%%the state of the channel.
if chnl < 1-p1-p2
    Y = X;%%not change
else if chnl > 1-p2
        Y = double(~X);%%swap
    else
        Y = 2;%%erase
    end
end
y(t) = Y;
%fprintf('%d',X);show the input
end
end
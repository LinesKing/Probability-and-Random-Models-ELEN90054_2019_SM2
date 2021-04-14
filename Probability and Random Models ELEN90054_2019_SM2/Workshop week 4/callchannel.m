function [Y] = callchannel(M,N,p1,p2)%%Y the each number of times with different times of swaping for M for the times of calling, N for the length of the string
Y = zeros(1,N+1);
for m=1:M
y = channel(0,N,p1,p2);%%The bit string is all 0, n=99, p1=0.2, p2=0.05.
yn = length(find(y==1));%%Find the number of swaping.
Y(yn+1) = Y(yn+1)+1;%%Calculate the each number of times with different times of swaping.
end
end
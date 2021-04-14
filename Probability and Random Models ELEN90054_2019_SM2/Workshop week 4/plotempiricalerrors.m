function [] = plotempiricalerrors(n1,p2l,p2h,M,p)%n1 is the n in question, p2l is the lower bound of p2,
                                                 %p2h is the higher bound of p2, M is the times calling the channel function
                                                 %p is the number of figure plotted
t=(p2h-p2l)/0.05+1;
error=zeros(1,t);
n=1;
for p2=p2l:0.05:p2h
    for i=1:M
      y = channel(0,n1,0,p2);%%The bit string is all 0, n=99, p1=0.
      y1(i) = length(find(y==1));%%Find the number of swaping.
      if y1(i)>=(n1+1)/2
          error(n)=error(n)+1;%%error(n) means the number of decoder errors when n=n;
      end
    end
    n = n+1;
end
figure(p);
p2=p2l:0.05:p2h;
stem(p2,error);
hold on;
end
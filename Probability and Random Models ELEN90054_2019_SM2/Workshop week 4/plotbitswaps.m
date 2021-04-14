function [] = plotbitswaps(p2l,p2h,M,p)
t=(p2h-p2l)/0.05+1;
error=zeros(1,t);
n=1;
for p2=p2l:0.05:p2h
    for i=1:M
      y = channel(0,99,0,p2);%%The bit string is all 0, n=99, p1=0.
      y1(i) = length(find(y==1));%%Find the number of swaping.
    end
 error(n)=sum(y1)/M;%%average number of decoder errors
n=n+1;
end
figure(p);
p2=p2l:0.05:p2h;
plot(p2,error);
set(gca,'XTick',[0:0.05:0.8])
hold on;
end
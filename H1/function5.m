function Ans=function5(x)
m=size(x);
sum_x=0;
for i=1:(m(2)-1)
    f=(100*(x(i+1)-x(i)^2)^2+(x(i)-1)^2);
	sum_x=sum_x+f;
end
Ans=sum_x;
end
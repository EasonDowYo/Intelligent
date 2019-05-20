function Ans=function8(x)
m=size(x);
sum_x=0;
for i=1:m(2)
    f=(-x(i))*sin( abs( x(i)^(1/2) ) );
	sum_x=sum_x+f;
end
Ans=sum_x;
end
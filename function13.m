function Ans=function13(x)
n=size(x);
a=5;
k=100;
m=4;
Sum_u=0;


for i=1:n(2)
    if x(i)>a
       A=k*(x(i)-a)^m;
    elseif -a<=x(i) && x(i)<=a
        A=0;
    elseif x(i)<(-a)
       A=k*(-x(i)-a)^m;
    end
Sum_u=Sum_u+A;
end


for j=1:(n(2)-1)
Sum_1=(x(j)-1)^2*(1+sin(3*pi*x(j+1))^2);
end
Ans=0.1*(sin(3*pi*x(1))^2+Sum_1+(x(n(2))-1)^2*(1+sin( 2*pi*x(n(2)) )^2 ))+Sum_u;

end
function Ans=function10(x)
[a n]=size(x);
Ans=-20*exp(-0.2*(1/n*sum(x.^2))^(1/2))-exp(1/n*sum( cos( 2*pi*x ) ) )+20+exp(1);
end


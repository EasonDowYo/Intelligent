function [fitnessvalue]=Osystem1(x)

a1=0.6;   %  0.3<=a1<=0.9
b1=0.3;   %  0.1<=b1<=0.5 

Kp=x(1);
Ki=x(2);
Kd=x(3);
uu0=zeros(1,30);
uu1=ones(1,30);

yd1=[uu1,uu0 ,uu1,uu0 ,uu1,uu0 ,uu1,uu0];
[~,timemax]=size(yd1);
yd1=[yd1,1];

y1=0;

integral=0;

previous_error=0;
t=linspace(1,timemax+1,timemax+1);
for k=1:timemax
    
    error(k)=y1(k)-yd1(k);
    integral=integral+error(k);
    derivative = (error(k) - previous_error);
    previous_error = error(k);
    CC(k) = Kp*error(k) + Ki*integral + Kd*derivative;
    
    y1(k+1)=a1*y1(k)+b1*y1(k)^3+0.2*CC(k);
    
%     e2(k)=y1(k)-yd1(k);
%     u1=(   -a1*y1(k)-b1*y1(k)^3+yd1(k+1)-0.9*e2(k)   )*5;
end
    

de=sum(abs(diff(error)));
Overshoot=[error(31),error(61),error(91),error(121),error(151),error(181),error(211)];
Overshoot59=[error(29),error(59),error(89),error(119),error(149),error(179),error(209)];
Overshoot2=[error(30),error(60),error(90),error(120),error(150),error(180),error(210)];
Overshoot3=[error(32),error(62),error(92),error(122),error(152),error(182),error(212)];
Overshoot4=[error(33),error(63),error(93),error(123),error(153),error(183),error(213)];
% fitnessvalue=sum(error.*error)+0.3*de+sum(Overshoot.*Overshoot)++sum(Overshoot2.*Overshoot2)+sum(Overshoot3.*Overshoot3)+sum(Overshoot4.*Overshoot4)+sum(Overshoot3.*Overshoot3)+sum(Overshoot59.*Overshoot59);

fitnessvalue=sum(error.*error);

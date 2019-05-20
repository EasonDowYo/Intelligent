function [fitnessvalue]=Osystem4(x)
Kp=x(1);
Ki=x(2);
Kd=x(3);

u0=zeros(1,30);
u1=ones(1,30);
% tyd=[u0,u1 ,u0,u1 ,u0,u1 ,u0,u1];
yd4=[u1 ,u0 ,u1 ,u0 ,u1 ,u0 ,u1,u0];
[~,timemax]=size(yd4);
error=0;
y4=2;
CC=0;
t=linspace(1,timemax+1,timemax+1);
previous_error=0;
integral=0;


% Kp=-0.15;
% Ki=-0.0108;
% Kd=-0.50;

for k=1:timemax
    error(k)=y4(k)-yd4(k);
    integral=integral+error(k);
    derivative = (error(k) - previous_error);
    previous_error = error(k);
    CC(k) = Kp*error(k) + Ki*integral + Kd*derivative;
    
    
    y4(k+1)=y4(k)/ ( 1+y4(k)^2 )+CC(k)^3;

    
end
    
de=sum(abs(diff(error)));
Overshoot=[error(31),error(61),error(91),error(121),error(151),error(181),error(211)];
Overshoot2=[error(30),error(60),error(90),error(120),error(150),error(180),error(210)];
o1=error(40:58);
o2=error(100:118);
o3=error(160:178);
o4=error(220:238);
Overshoot3=[error(45),error(75),error(105),error(135),error(165),error(195),error(225)];

fitnessvalue=sum(error.*error)+de+10*sum(Overshoot2.*Overshoot2)+100/sum(CC.*CC)+3*sum(Overshoot3.*Overshoot3)+sum(o1.*o1)+sum(o2.*o2)+sum(o3.*o3)+sum(o4.*o4);




clc;close all;clear all;




a1=0.6;   %  0.3<=a1<=0.9
b1=0.3;   %  0.1<=b1<=0.5 

Kp=-0.05;
Ki=-0.05;
Kd=-0.015;
Kp= [-4.78133072956823];
Ki= [-0.00301713355077937];
Kd= [-0.0762937195375116];
% Kp=-2.187755158849316;
% Ki=10.192119684335022;
% Kd=9.002823918052558;
Kp= -5.1262;
Ki= 0.01301713355077937;
Kd= 1.8332;


Kp=-4.544580771162344;
Ki=-0.471731954092701;
Kd=0.024492725810524;


uu0=zeros(1,30);
uu1=ones(1,30);

yd1=[uu1,uu0 ,uu1,uu0 ,uu1,uu0 ,uu1,uu0];
[~,timemax]=size(yd1);
yd1=[yd1,1];
y1=0;
u1=0;
integral=0;
derivative=0;
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
    



hold on
grid on
plot(t,y1,'LineWidth',2)
plot(t,yd1,'--','LineWidth',2)
legend('y2','yd');
% title('System 2','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('y','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off


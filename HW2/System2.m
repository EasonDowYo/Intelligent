clc;close all;clear all;


a1=0.6;   %  0.3<=a1<=0.9
b1=0.3;   %  0.1<=b1<=0.5 
c2=0.2;   %   0.1<=c1<0.3


u0=zeros(1,30);
u1=ones(1,30);
% tyd=[u0,u1 ,u0,u1 ,u0,u1 ,u0,u1];
yd2=[u1,u0 ,u1,u0 ,u1,u0 ,u1,u0];
[~,timemax]=size(yd2);

y2=2;
CC=0;
t=linspace(1,timemax+1,timemax+1);
previous_error=0;
integral=0;
% 自己的
% Kp=-6.5;
% Ki=-0.5;
% Kd=0.3;
% 只有誤差
% Kp=-0.527451465207760;
% Ki=0.024930166074677;
% Kd=-1.702157386463656;

% Kp=-0.002939311395032;
% Ki=0.012986749156185;
% Kd=-3.651841068112715;

% 還不錯
% Kp=-0.484626314742542;
% Ki=0.023373056613152;
% Kd=-0.942116588446979;

% 還不錯
% Kp=-0.567842418666437;
% Ki=-0.025668065039452;
% Kd=-1.259887045119152;
% 還不錯
Kp=-0.468661584397085;
Ki=0.023251445440041;
Kd=-1.392625160129054;



for k=1:timemax
    error(k)=y2(k)-yd2(k);
    integral=integral+error(k);
    derivative = (error(k) - previous_error);
    previous_error = error(k);
    CC(k) = Kp*error(k) + Ki*integral + Kd*derivative;
    if k>4
        y2(k+1)=0.95*y2(k)+c2*CC(k-4);
    else
        y2(k+1)=0.95*y2(k);
    end    
    
end
    


figure(1)
hold on
grid on
plot(t,y2,'LineWidth',3.5)
plot(t,[yd2,0],'--','LineWidth',3.5)
legend('y2','yd');
% title('System 2','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',18);   
ylabel('y','fontname','times new roman','Fontangle','italic','FontSize',18);
hold off


figure(2)
hold on
grid on
plot(t,[0,CC],'LineWidth',3.5)
legend('u2');
% title('System 2','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',18);   
ylabel('u','fontname','times new roman','Fontangle','italic','FontSize',18);
hold off


figure(3)
hold on
grid on
plot(t,[0,error],'LineWidth',3.5)
legend('Error');
% title('System 2','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',18);   
ylabel('Error','fontname','times new roman','Fontangle','italic','FontSize',18);
hold off


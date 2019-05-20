clc;close all;clear all;

% load('sys4wao.mat')
% g=4;
% Kp=All_F2_ELPSO_gbestPosition(g,1);
% Ki=All_F2_ELPSO_gbestPosition(g,2);
% Kd=All_F2_ELPSO_gbestPosition(g,3);
u0=zeros(1,30);
u1=ones(1,30);
% tyd=[u0,u1 ,u0,u1 ,u0,u1 ,u0,u1];
yd4=[u1 ,u0 ,u1 ,u0 ,u1 ,u0 ,u1,u0];
[~,timemax]=size(yd4);

y4=2;
CC=0;
t=linspace(1,timemax+1,timemax+1);
previous_error=0;
integral=0;
% 讚 必留
Kp=-0.360509036872514;
Ki=-0.347235515594562;
Kd=0.020842145807817;
%

Kp=-0.362750383670307;
Ki=-0.355143241086810;
Kd=0.021309699397744;

Kp=-0.364466305996321;
Ki=-0.356000132153156;
Kd=0.022343552957997;

Kp=-0.364466305996321;
Ki=-0.356000132153156;
Kd=0.022343552957997;
%重則
% Kp=-0.1497;
% Ki=-0.3316;
% Kd=-0.0683;



% 立凱的
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
    


figure(1)
hold on
grid on
plot(t,y4,'LineWidth',3.5)
plot(t,[yd4,0],'--','LineWidth',3.5)
legend('y4','yd');
% title('System 2','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',18);   
ylabel('y','fontname','times new roman','Fontangle','italic','FontSize',18);
hold off


figure(2)
hold on
grid on
plot(t,[0,CC],'LineWidth',3.5)
legend('u4');
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


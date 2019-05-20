clc;close all;clear all;

% load('sys4wao.mat')
% g=4;
% Kp=All_F2_ELPSO_gbestPosition(g,1);
% Ki=All_F2_ELPSO_gbestPosition(g,2);
% Kd=All_F2_ELPSO_gbestPosition(g,3);
u0=zeros(1,30);
u1=ones(1,30);

yd3=[u1 ,u0 ,u1 ,u0 ,u1 ,u0 ,u1,u0];
[~,timemax]=size(yd3);
k=1;
y3=0;
y3(k+1)=0;
CC=0;
t=linspace(1,timemax,timemax);
previous_error=0;
integral=0;
% 自己的
Kp=-1.0360509036872514;
Ki=-0.347235515594562;
Kd=0.020842145807817;
% 誤差+de


% 立凱的
% Kp=-0.15;
% Ki=-0.0108;
% Kd=-0.50;
error=0;

CC(k+1)=1;
for k=1:timemax-1
%     y3(k+1)
    error(k+1)=y3(k)-yd3(k);
    integral=integral+error(k+1);
    derivative = (error(k+1) - previous_error);
    previous_error = error(k+1);
    CC(k+1) = Kp*error(k+1) + Ki*integral + Kd*derivative;
%     CC(k+1) = Kp*error(k)+ Kd*derivative;
    
    y3(k+1)=y3(k)+CC(k+1);

    

    
    
end
    


figure(1)
hold on
grid on
plot(t,y3,'LineWidth',3.5)
plot(t,[yd3],'--','LineWidth',3.5)
legend('y3','yd');
% title('System 2','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',18);   
ylabel('y','fontname','times new roman','Fontangle','italic','FontSize',18);
hold off


figure(2)
hold on
grid on
plot(t,[CC],'LineWidth',3.5)
legend('u3');
% title('System 2','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',18);   
ylabel('u','fontname','times new roman','Fontangle','italic','FontSize',18);
hold off


figure(3)
hold on
grid on
plot(t,[error],'LineWidth',3.5)
legend('Error');
% title('System 2','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',18);   
ylabel('Error','fontname','times new roman','Fontangle','italic','FontSize',18);
hold off


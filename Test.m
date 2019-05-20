clc;clear;close;

Turn=1000;
% fnumber=[2 5 10 13 15 18 23];
fnumber=[2];
oa1='PSO';
oa2='ELPSO';
sz=size(fnumber);
%% Initialize Parameter in Program %%%%%%%%%%%
F2parameter = struct( 'c1',1.5,'c2',1.5,'itertime',1000,'LowerBound',-5,'UpperBound',5);
F2PTCparameter=struct( 'number',50,'Dim',4);

F5parameter = struct( 'c1',1.5,'c2',1.5,'itertime',1000,'LowerBound',-30,'UpperBound',30);
F5PTCparameter=struct( 'number',50,'Dim',30);

F8parameter = struct( 'w',0.5,'c1',1.5,'c2',1.5,'A0',0.95,'arpha',-0.1,'itertime',1000,'LowerBound',-500,'UpperBound',500);
F8PTCparameter=struct( 'number',50,'Dim',30);
F10parameter = struct( 'w',0.5,'c1',1.5,'c2',1.5,'A0',0.95,'arpha',0.9,'itertime',1000,'LowerBound',-32,'UpperBound',32);
F10PTCparameter=struct( 'number',50,'Dim',30);
F13parameter = struct( 'w',0.5,'c1',1.5,'c2',1.5,'A0',0.95,'arpha',0.9,'itertime',1000,'LowerBound',-50,'UpperBound',50);
F13PTCparameter=struct( 'number',50,'Dim',30);
F15parameter = struct( 'w',0.5,'c1',1.5,'c2',1.5,'A0',0.95,'arpha',0.9,'itertime',1000,'LowerBound',-5,'UpperBound',5);
F15PTCparameter=struct( 'number',50,'Dim',4);
F18parameter = struct( 'w',0.5,'c1',1.5,'c2',1.5,'A0',0.95,'arpha',0.9,'itertime',1000,'LowerBound',-5,'UpperBound',5);
F18PTCparameter=struct( 'number',50,'Dim',2);
F23parameter = struct( 'w',0.5,'c1',1.5,'c2',1.5,'A0',0.95,'arpha',0.9,'itertime',1000,'LowerBound',0,'UpperBound',10);
F23PTCparameter=struct( 'number',50,'Dim',4);


for i=1:sz(2)
    %CPSO
    eval( strcat( 'All_F' ,num2str(fnumber(i)) ,'_' ,oa1 ,'_gbestPosition','=','zeros(Turn,',num2str(F2PTCparameter.Dim) ,') ;' ) )
    eval( strcat( 'All_F' ,num2str(fnumber(i)) ,'_' ,oa1 ,'_gbestFit','=','zeros(Turn,1) ;' ) )
    eval( strcat( 'F' ,num2str(fnumber(i)) ,'_' ,oa1 ,'_AverageMean_inlastTime','=','0 ;' ) )
    eval( strcat( 'F' ,num2str(fnumber(i)) ,'_' ,oa1 ,'_Average_gbestFit','=','zeros(1,' ,num2str(F2parameter.itertime) ,') ;' ) )
    %ELPSO
    eval( strcat( 'All_F' ,num2str(fnumber(i)) ,'_' ,oa2 ,'_gbestPosition','=','zeros(Turn,',num2str(F2PTCparameter.Dim) ,') ;' ) )
    eval( strcat( 'All_F' ,num2str(fnumber(i)) ,'_' ,oa2 ,'_gbestFit','=','zeros(Turn,1) ;' ) )
    eval( strcat( 'F' ,num2str(fnumber(i)) ,'_' ,oa2 ,'_AverageMean_inlastTime','=','0 ;' ) )
    eval( strcat( 'F' ,num2str(fnumber(i)) ,'_' ,oa2 ,'_Average_gbestFit','=','zeros(1,' ,num2str(F2parameter.itertime) ,') ;' ) )
end

m1=0;
m2=0;
m3=0;
m4=0;
m5=0;
WINct=0;
for i=1:Turn
    fprintf('Currently processed to %d turn \n',i)
    %% Function 2 %%%%%%%%%%%%%%%%
    % Initialize Particle Position
    F2population=generatePTC(F2PTCparameter.number, F2PTCparameter.Dim, F2parameter.LowerBound, F2parameter.UpperBound);   %generate particle
    
    [F2_PSO_hisGbest,F2_PSO_hisAverage,F2_PSO_gbestPosition,F2_PSO_iteration]=OA_PSO_min(@function15,F2population,F2parameter);
    All_F2_PSO_gbestPosition(i,:)=F2_PSO_gbestPosition;
    All_F2_PSO_gbestFit(i)=F2_PSO_hisGbest(end);
    F2_PSO_AverageMean_inlastTime=F2_PSO_AverageMean_inlastTime+F2_PSO_hisAverage(end)/Turn;
    F2_PSO_Average_gbestFit=F2_PSO_Average_gbestFit+F2_PSO_hisGbest/Turn;
    
    [F2_ELPSO_hisGbest,F2_ELPSO_hisAverage,F2_ELPSO_gbestPosition,F2_ELPSO_iteration]=OA_OSC_PSO_min(@function15,F2population,F2parameter);
    All_F2_ELPSO_gbestPosition(i,:)=F2_ELPSO_gbestPosition;
    All_F2_ELPSO_gbestFit(i)=F2_ELPSO_hisGbest(end);
    F2_ELPSO_AverageMean_inlastTime=F2_ELPSO_AverageMean_inlastTime+F2_ELPSO_hisAverage(end)/Turn;
    F2_ELPSO_Average_gbestFit=F2_ELPSO_Average_gbestFit+F2_ELPSO_hisGbest/Turn;

    if (F2_PSO_hisGbest(end)-0.0003)>(F2_ELPSO_hisGbest(end)-0.0003)
        WINct=WINct+1;
    end
end
[~,idx]=min(All_F2_PSO_gbestFit-0.0003);
All_F2_PSO_gbestFit(idx)
[~,idx2]=min(All_F2_ELPSO_gbestFit-0.0003);
All_F2_ELPSO_gbestFit(idx2)
figure(1)
hold on
grid on
plot(F2_PSO_iteration,F2_PSO_Average_gbestFit,'b','LineWidth',2.5)
plot(F2_ELPSO_iteration,F2_ELPSO_Average_gbestFit,'r--','LineWidth',2.5)
legend('PSO','ELPSO');
title('F15','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

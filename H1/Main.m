clc;clear; close all;
Turn=50;

%% Best Position of Every Turn %%%%%%%%%%%%%%%%%%%
All_F2_PSO_gbestPosition=zeros(Turn,30);
All_F5_PSO_gbestPosition=zeros(Turn,30);
All_F8_PSO_gbestPosition=zeros(Turn,30);
All_F10_PSO_gbestPosition=zeros(Turn,30);
All_F13_PSO_gbestPosition=zeros(Turn,30);
All_F15_PSO_gbestPosition=zeros(Turn,4);
All_F18_PSO_gbestPosition=zeros(Turn,2);
All_F23_PSO_gbestPosition=zeros(Turn,4);
%
All_F2_WAO_gbestPosition=zeros(Turn,30);
All_F5_WAO_gbestPosition=zeros(Turn,30);
All_F8_WAO_gbestPosition=zeros(Turn,30);
All_F10_WAO_gbestPosition=zeros(Turn,30);
All_F13_WAO_gbestPosition=zeros(Turn,30);
All_F15_WAO_gbestPosition=zeros(Turn,4);
All_F18_WAO_gbestPosition=zeros(Turn,2);
All_F23_WAO_gbestPosition=zeros(Turn,4);
%
All_F2_BA_gbestPosition=zeros(Turn,30);
All_F5_BA_gbestPosition=zeros(Turn,30);
All_F8_BA_gbestPosition=zeros(Turn,30);
All_F10_BA_gbestPosition=zeros(Turn,30);
All_F13_BA_gbestPosition=zeros(Turn,30);
All_F15_BA_gbestPosition=zeros(Turn,4);
All_F18_BA_gbestPosition=zeros(Turn,2);
All_F23_BA_gbestPosition=zeros(Turn,4);
%% Final best so far solution of every turns %%%%%%%%%%%%%%%%%%%%%
All_F2_PSO_gbestFit=zeros(Turn,1);
All_F5_PSO_gbestFit=zeros(Turn,1);
All_F8_PSO_gbestFit=zeros(Turn,1);
All_F10_PSO_gbestFit=zeros(Turn,1);
All_F13_PSO_gbestFit=zeros(Turn,1);
All_F15_PSO_gbestFit=zeros(Turn,1);
All_F18_PSO_gbestFit=zeros(Turn,1);
All_F23_PSO_gbestFit=zeros(Turn,1);
%
All_F2_WAO_gbestFit=zeros(Turn,1);
All_F5_WAO_gbestFit=zeros(Turn,1);
All_F8_WAO_gbestFit=zeros(Turn,1);
All_F10_WAO_gbestFit=zeros(Turn,1);
All_F13_WAO_gbestFit=zeros(Turn,1);
All_F15_WAO_gbestFit=zeros(Turn,1);
All_F18_WAO_gbestFit=zeros(Turn,1);
All_F23_WAO_gbestFit=zeros(Turn,1);
%
All_F2_BA_gbestFit=zeros(Turn,1);
All_F5_BA_gbestFit=zeros(Turn,1);
All_F8_BA_gbestFit=zeros(Turn,1);
All_F10_BA_gbestFit=zeros(Turn,1);
All_F13_BA_gbestFit=zeros(Turn,1);
All_F15_BA_gbestFit=zeros(Turn,1);
All_F18_BA_gbestFit=zeros(Turn,1);
All_F23_BA_gbestFit=zeros(Turn,1);
%
%% Average mean fitness in the last iteration %%%%%%%%%%%%%%%%%%%%%
F2_PSO_average_mean_hisAverage=0;
F5_PSO_average_mean_hisAverage=0;
F8_PSO_average_mean_hisAverage=0;
F10_PSO_average_mean_hisAverage=0;
F13_PSO_average_mean_hisAverage=0;
F15_PSO_average_mean_hisAverage=0;
F18_PSO_average_mean_hisAverage=0;
F23_PSO_average_mean_hisAverage=0;
%
F2_WAO_average_mean_hisAverage=0;
F5_WAO_average_mean_hisAverage=0;
F8_WAO_average_mean_hisAverage=0;
F10_WAO_average_mean_hisAverage=0;
F13_WAO_average_mean_hisAverage=0;
F15_WAO_average_mean_hisAverage=0;
F18_WAO_average_mean_hisAverage=0;
F23_WAO_average_mean_hisAverage=0;
%
F2_BA_average_mean_hisAverage=0;
F5_BA_average_mean_hisAverage=0;
F8_BA_average_mean_hisAverage=0;
F10_BA_average_mean_hisAverage=0;
F13_BA_average_mean_hisAverage=0;
F15_BA_average_mean_hisAverage=0;
F18_BA_average_mean_hisAverage=0;
F23_BA_average_mean_hisAverage=0;

%% Average of History of Best Fitness Value %%%%%%%%%%%%%%%%%%%%
F2_BA_Average_hisgbestFit=zeros(1,1000);
F5_BA_Average_hisgbestFit=zeros(1,1000);
F8_BA_Average_hisgbestFit=zeros(1,1000);
F10_BA_Average_hisgbestFit=zeros(1,1000);
F13_BA_Average_hisgbestFit=zeros(1,1000);
F15_BA_Average_hisgbestFit=zeros(1,1000);
F18_BA_Average_hisgbestFit=zeros(1,1000);
F23_BA_Average_hisgbestFit=zeros(1,1000);

F2_WAO_Average_hisgbestFit=zeros(1,1000);
F5_WAO_Average_hisgbestFit=zeros(1,1000);
F8_WAO_Average_hisgbestFit=zeros(1,1000);
F10_WAO_Average_hisgbestFit=zeros(1,1000);
F13_WAO_Average_hisgbestFit=zeros(1,1000);
F15_WAO_Average_hisgbestFit=zeros(1,1000);
F18_WAO_Average_hisgbestFit=zeros(1,1000);
F23_WAO_Average_hisgbestFit=zeros(1,1000);

F2_PSO_Average_hisgbestFit=zeros(1,1000);
F5_PSO_Average_hisgbestFit=zeros(1,1000);
F8_PSO_Average_hisgbestFit=zeros(1,1000);
F10_PSO_Average_hisgbestFit=zeros(1,1000);
F13_PSO_Average_hisgbestFit=zeros(1,1000);
F15_PSO_Average_hisgbestFit=zeros(1,1000);
F18_PSO_Average_hisgbestFit=zeros(1,1000);
F23_PSO_Average_hisgbestFit=zeros(1,1000);

%% Optimization Algorithm Start %%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:Turn
    fprintf('Currently processed to %d turn \n',i)
    %% Function 2 %%%%%%%%%%%%%%%%
    F2parameter = struct( 'w',0.5,'c1',1.5,'c2',1.5,'A0',0.95,'arpha',0.9,'itertime',1000,'LowerBound',-10,'UpperBound',10);
    F2PTCparameter=struct( 'number',50,'Dim',30,'LowerBound',-10,'UpperBound',10);
    % Initialize Particle Position
    F2population=generatePTC(F2PTCparameter.number, F2PTCparameter.Dim, F2parameter.LowerBound, F2parameter.UpperBound);   %generate particle
    % Result of PSO and WAO
    [F2_PSO_hisGbest,F2_PSO_hisAverage,F2_PSO_gbestPosition,F2_PSO_iteration]=OA_PSO_min(@function2,F2population,F2parameter);
    [F2_WAO_hisGbest,F2_WAO_hisAverage,F2_WAO_gbestPosition,F2_WAO_iteration]=OA_PSO_min(@function2,F2population,F2parameter);
    [F2_BA_hisGbest,F2_BA_hisAverage,F2_BA_gbestPosition,F2_BA_iteration]=OA_BA_min(@function2,F2population,F2parameter);
    
    All_F2_PSO_gbestPosition(i,:)=F2_PSO_gbestPosition;
    All_F2_PSO_gbestFit(i)=F2_PSO_hisGbest(end);
    F2_PSO_average_mean_hisAverage=F2_PSO_average_mean_hisAverage+F2_PSO_hisAverage(end)/Turn;
    F2_PSO_Average_hisgbestFit=F2_PSO_Average_hisgbestFit+F2_PSO_hisGbest/Turn;
    
    All_F2_WAO_gbestPosition(i,:)=F2_WAO_gbestPosition;
    All_F2_WAO_gbestFit(i)=F2_WAO_hisGbest(end);
    F2_WAO_Average_hisgbestFit=F2_WAO_Average_hisgbestFit+F2_WAO_hisGbest/Turn;
    F2_WAO_average_mean_hisAverage=F2_WAO_average_mean_hisAverage+F2_PSO_hisAverage(end)/Turn;
    
    All_F2_BA_gbestPosition(i,:)=F2_BA_gbestPosition;
    All_F2_BA_gbestFit(i)=F2_BA_hisGbest(end);
    F2_BA_Average_hisgbestFit=F2_BA_Average_hisgbestFit+F2_BA_hisGbest/Turn;
    F2_BA_average_mean_hisAverage=F2_BA_average_mean_hisAverage+F2_BA_hisAverage(end)/Turn;
    
    %% Function 5 %%%%%%%%%%%%%%%%
    F5parameter = struct( 'w',0.5,'c1',1.5,'c2',1.5,'A0',0.95,'arpha',0.9,'itertime',1000,'LowerBound',-30,'UpperBound',30);
    F5PTCparameter=struct( 'number',50,'Dim',30);
    % Initialize Particle Position
    F5population=generatePTC(F5PTCparameter.number, F5PTCparameter.Dim, F5parameter.LowerBound, F5parameter.UpperBound);   %generate particle
    % Result of PSO and WAO
    [F5_PSO_hisGbest,F5_PSO_hisAverage,F5_PSO_gbestPosition,F5_PSO_iteration]=OA_PSO_min(@function5,F5population,F5parameter);
    [F5_WAO_hisGbest,F5_WAO_hisAverage,F5_WAO_gbestPosition,F5_WAO_iteration]=OA_WAO_min(@function5,F5population,F5parameter);
    [F5_BA_hisGbest,F5_BA_hisAverage,F5_BA_gbestPosition,F5_BA_iteration]=OA_BA_min(@function5,F5population,F5parameter);
    
    All_F5_PSO_gbestPosition(i,:)=F5_PSO_gbestPosition;
    All_F5_PSO_gbestFit(i)=F5_PSO_hisGbest(end);
    F5_PSO_Average_hisgbestFit=F5_PSO_Average_hisgbestFit+F5_PSO_hisGbest/Turn;
    F5_PSO_average_mean_hisAverage=F5_PSO_average_mean_hisAverage+F5_PSO_hisAverage(end)/Turn;
    
    All_F5_WAO_gbestPosition(i,:)=F5_WAO_gbestPosition;
    All_F5_WAO_gbestFit(i)=F5_WAO_hisGbest(end);
    F5_WAO_Average_hisgbestFit=F5_WAO_Average_hisgbestFit+F5_WAO_hisGbest/Turn;
    F5_WAO_average_mean_hisAverage=F5_WAO_average_mean_hisAverage+F5_PSO_hisAverage(end)/Turn;
    
    All_F5_BA_gbestPosition(i,:)=F5_BA_gbestPosition;
    All_F5_BA_gbestFit(i)=F5_BA_hisGbest(end);
    F5_BA_Average_hisgbestFit=F5_BA_Average_hisgbestFit+F5_BA_hisGbest/Turn;
    F5_BA_average_mean_hisAverage=F5_BA_average_mean_hisAverage+F5_BA_hisAverage(end)/Turn;
    
    %% Function 8 %%%%%%%%%%%%%%%%
    F8parameter = struct( 'w',0.5,'c1',1.5,'c2',1.5,'A0',0.95,'arpha',-0.1,'itertime',1000,'LowerBound',-500,'UpperBound',500);
    F8PTCparameter=struct( 'number',50,'Dim',30);
    % Initialize Particle Position
    F8population=generatePTC(F8PTCparameter.number, F8PTCparameter.Dim, F8parameter.LowerBound, F8parameter.UpperBound);   %generate particle
    % Result of PSO and WAO
    [F8_PSO_hisGbest,F8_PSO_hisAverage,F8_PSO_gbestPosition,F8_PSO_iteration]=OA_PSO_min(@function8,F8population,F8parameter);
    [F8_WAO_hisGbest,F8_WAO_hisAverage,F8_WAO_gbestPosition,F8_WAO_iteration]=OA_WAO_min(@function8,F8population,F8parameter);
    [F8_BA_hisGbest,F8_BA_hisAverage,F8_BA_gbestPosition,F8_BA_iteration]=OA_BA_min(@function8,F8population,F8parameter);
    
    All_F8_PSO_gbestPosition(i,:)=F8_PSO_gbestPosition;
    All_F8_PSO_gbestFit(i)=F8_PSO_hisGbest(end);
    F8_PSO_Average_hisgbestFit=F8_PSO_Average_hisgbestFit+F8_PSO_hisGbest/Turn;
    F8_PSO_average_mean_hisAverage=F8_PSO_average_mean_hisAverage+F8_PSO_hisAverage(end)/Turn;
    
    All_F8_WAO_gbestPosition(i,:)=F8_WAO_gbestPosition;
    All_F8_WAO_gbestFit(i)=F8_WAO_hisGbest(end);
    F8_WAO_Average_hisgbestFit=F8_WAO_Average_hisgbestFit+F8_WAO_hisGbest/Turn;
    F8_WAO_average_mean_hisAverage=F8_WAO_average_mean_hisAverage+F8_PSO_hisAverage(end)/Turn;
    
    All_F8_BA_gbestPosition(i,:)=F8_BA_gbestPosition;
    All_F8_BA_gbestFit(i)=F8_BA_hisGbest(end);
    F8_BA_Average_hisgbestFit=F8_BA_Average_hisgbestFit+F8_BA_hisGbest/Turn;
    F8_BA_average_mean_hisAverage=F8_BA_average_mean_hisAverage+F8_BA_hisAverage(end)/Turn;
    
    %% Function 10 %%%%%%%%%%%%%%%
    F10parameter = struct( 'w',0.5,'c1',1.5,'c2',1.5,'A0',0.95,'arpha',0.9,'itertime',1000,'LowerBound',-32,'UpperBound',32);
    F10PTCparameter=struct( 'number',50,'Dim',30);
    % Initialize Particle Position
    F10population=generatePTC(F10PTCparameter.number, F10PTCparameter.Dim, F10parameter.LowerBound, F10parameter.UpperBound);   %generate particle
    % Result of PSO and WAO
    [F10_PSO_hisGbest,F10_PSO_hisAverage,F10_PSO_gbestPosition,F10_PSO_iteration]=OA_PSO_min(@function10,F10population,F10parameter);
    [F10_WAO_hisGbest,F10_WAO_hisAverage,F10_WAO_gbestPosition,F10_WAO_iteration]=OA_WAO_min(@function10,F10population,F10parameter);
    [F10_BA_hisGbest,F10_BA_hisAverage,F10_BA_gbestPosition,F10_BA_iteration]=OA_BA_min(@function10,F10population,F10parameter);
    
    All_F10_PSO_gbestPosition(i,:)=F10_PSO_gbestPosition;
    All_F10_PSO_gbestFit(i)=F10_PSO_hisGbest(end);
    F10_PSO_Average_hisgbestFit=F10_PSO_Average_hisgbestFit+F10_PSO_hisGbest/Turn;
    F10_PSO_average_mean_hisAverage=F10_PSO_average_mean_hisAverage+F10_PSO_hisAverage(end)/Turn;
    
    All_F10_WAO_gbestPosition(i,:)=F10_WAO_gbestPosition;
    All_F10_WAO_gbestFit(i)=F10_WAO_hisGbest(end);
    F10_WAO_Average_hisgbestFit=F10_WAO_Average_hisgbestFit+F10_WAO_hisGbest/Turn;
    F10_WAO_average_mean_hisAverage=F10_WAO_average_mean_hisAverage+F10_PSO_hisAverage(end)/Turn;
    
    All_F10_BA_gbestPosition(i,:)=F10_BA_gbestPosition;
    All_F10_BA_gbestFit(i)=F10_BA_hisGbest(end);
    F10_BA_Average_hisgbestFit=F10_BA_Average_hisgbestFit+F10_BA_hisGbest/Turn;
    F10_BA_average_mean_hisAverage=F10_BA_average_mean_hisAverage+F10_BA_hisAverage(end)/Turn;
    
    %% Function 13 %%%%%%%%%%%%%%%
    F13parameter = struct( 'w',0.5,'c1',1.5,'c2',1.5,'A0',0.95,'arpha',0.9,'itertime',1000,'LowerBound',-50,'UpperBound',50);
    F13PTCparameter=struct( 'number',50,'Dim',30);
    % Initialize Particle Position
    F13population=generatePTC(F13PTCparameter.number, F13PTCparameter.Dim, F13parameter.LowerBound, F13parameter.UpperBound);   %generate particle
    % Result of PSO and WAO
    [F13_PSO_hisGbest,F13_PSO_hisAverage,F13_PSO_gbestPosition,F13_PSO_iteration]=OA_PSO_min(@function13,F13population,F13parameter);
    [F13_WAO_hisGbest,F13_WAO_hisAverage,F13_WAO_gbestPosition,F13_WAO_iteration]=OA_WAO_min(@function13,F13population,F13parameter);
    [F13_BA_hisGbest,F13_BA_hisAverage,F13_BA_gbestPosition,F13_BA_iteration]=OA_BA_min(@function13,F13population,F13parameter);
    
    All_F13_PSO_gbestPosition(i,:)=F13_PSO_gbestPosition;
    All_F13_PSO_gbestFit(i)=F13_PSO_hisGbest(end);
    F13_PSO_Average_hisgbestFit=F13_PSO_Average_hisgbestFit+F13_PSO_hisGbest/Turn;
    F13_PSO_average_mean_hisAverage=F13_PSO_average_mean_hisAverage+F13_PSO_hisAverage(end)/Turn;
    
    All_F13_WAO_gbestPosition(i,:)=F13_WAO_gbestPosition;
    All_F13_WAO_gbestFit(i)=F13_WAO_hisGbest(end);
    F13_WAO_Average_hisgbestFit=F13_WAO_Average_hisgbestFit+F13_WAO_hisGbest/Turn;
    F13_WAO_average_mean_hisAverage=F13_WAO_average_mean_hisAverage+F13_PSO_hisAverage(end)/Turn;
    
    All_F13_BA_gbestPosition(i,:)=F13_BA_gbestPosition;
    All_F13_BA_gbestFit(i)=F13_BA_hisGbest(end);
    F13_BA_Average_hisgbestFit=F13_BA_Average_hisgbestFit+F13_BA_hisGbest/Turn;
    F13_BA_average_mean_hisAverage=F13_BA_average_mean_hisAverage+F13_BA_hisAverage(end)/Turn;
    
    %% Function 15 %%%%%%%%%%%%%%%
    F15parameter = struct( 'w',0.5,'c1',1.5,'c2',1.5,'A0',0.95,'arpha',0.9,'itertime',1000,'LowerBound',-5,'UpperBound',5);
    F15PTCparameter=struct( 'number',50,'Dim',4);
    % Initialize Particle Position
    F15population=generatePTC(F15PTCparameter.number, F15PTCparameter.Dim, F15parameter.LowerBound, F15parameter.UpperBound);   %generate particle
    % Result of PSO and WAO
    [F15_PSO_hisGbest,F15_PSO_hisAverage,F15_PSO_gbestPosition,F15_PSO_iteration]=OA_PSO_min(@function15,F15population,F15parameter);
    [F15_WAO_hisGbest,F15_WAO_hisAverage,F15_WAO_gbestPosition,F15_WAO_iteration]=OA_WAO_min(@function15,F15population,F15parameter);
    [F15_BA_hisGbest,F15_BA_hisAverage,F15_BA_gbestPosition,F15_BA_iteration]=OA_BA_min(@function15,F15population,F15parameter);
    
    All_F15_PSO_gbestPosition(i,:)=F15_PSO_gbestPosition;
    All_F15_PSO_gbestFit(i)=F15_PSO_hisGbest(end);
    F15_PSO_Average_hisgbestFit=F15_PSO_Average_hisgbestFit+F15_PSO_hisGbest/Turn;
    F15_PSO_average_mean_hisAverage=F15_PSO_average_mean_hisAverage+F15_PSO_hisAverage(end)/Turn;
    
    All_F15_WAO_gbestPosition(i,:)=F15_WAO_gbestPosition;
    All_F15_WAO_gbestFit(i)=F15_WAO_hisGbest(end);
    F15_WAO_Average_hisgbestFit=F15_WAO_Average_hisgbestFit+F15_WAO_hisGbest/Turn;
    F15_WAO_average_mean_hisAverage=F15_WAO_average_mean_hisAverage+F15_PSO_hisAverage(end)/Turn;
    
    All_F15_WAO_gbestPosition(i,:)=F15_WAO_gbestPosition;
    All_F15_WAO_gbestFit(i)=F15_WAO_hisGbest(end);
    F15_BA_Average_hisgbestFit=F15_BA_Average_hisgbestFit+F15_BA_hisGbest/Turn;
    F15_BA_average_mean_hisAverage=F15_BA_average_mean_hisAverage+F15_BA_hisAverage(end)/Turn;
    
    %% Function 18 %%%%%%%%%%%%%%%
    F18parameter = struct( 'w',0.5,'c1',1.5,'c2',1.5,'A0',0.95,'arpha',0.9,'itertime',1000,'LowerBound',-5,'UpperBound',5);
    F18PTCparameter=struct( 'number',50,'Dim',2);
    % Initialize Particle Position
    F18population=generatePTC(F18PTCparameter.number, F18PTCparameter.Dim, F18parameter.LowerBound, F18parameter.UpperBound);   %generate particle
    % Result of PSO and WAO
    [F18_PSO_hisGbest,F18_PSO_hisAverage,F18_PSO_gbestPosition,F18_PSO_iteration]=OA_PSO_min(@function18,F18population,F18parameter);
    [F18_WAO_hisGbest,F18_WAO_hisAverage,F18_WAO_gbestPosition,F18_WAO_iteration]=OA_WAO_min(@function18,F18population,F18parameter);
    [F18_BA_hisGbest,F18_BA_hisAverage,F18_BA_gbestPosition,F18_BA_iteration]=OA_BA_min(@function18,F18population,F18parameter);
    
    All_F18_PSO_gbestPosition(i,:)=F18_PSO_gbestPosition;
    All_F18_PSO_gbestFit(i)=F18_PSO_hisGbest(end);
    F18_PSO_Average_hisgbestFit=F18_PSO_Average_hisgbestFit+F18_PSO_hisGbest/Turn;
    F18_PSO_average_mean_hisAverage=F18_PSO_average_mean_hisAverage+F18_PSO_hisAverage(end)/Turn;
    
    All_F18_WAO_gbestPosition(i,:)=F18_WAO_gbestPosition;
    All_F18_WAO_gbestFit(i)=F18_WAO_hisGbest(end);
    F18_WAO_Average_hisgbestFit=F18_WAO_Average_hisgbestFit+F18_WAO_hisGbest/Turn;
    F18_WAO_average_mean_hisAverage=F18_WAO_average_mean_hisAverage+F18_PSO_hisAverage(end)/Turn;
    
    All_F18_BA_gbestPosition(i,:)=F18_BA_gbestPosition;
    All_F18_BA_gbestFit(i)=F18_BA_hisGbest(end);
    F18_BA_Average_hisgbestFit=F18_BA_Average_hisgbestFit+F18_BA_hisGbest/Turn;
    F18_BA_average_mean_hisAverage=F18_BA_average_mean_hisAverage+F18_BA_hisAverage(end)/Turn;
    
    %% Function 23 %%%%%%%%%%%%%%%
    F23parameter = struct( 'w',0.5,'c1',1.5,'c2',1.5,'A0',0.95,'arpha',0.9,'itertime',1000,'LowerBound',0,'UpperBound',10);
    F23PTCparameter=struct( 'number',50,'Dim',4);
    % Initialize Particle Position
    F23population=generatePTC(F23PTCparameter.number, F23PTCparameter.Dim, F23parameter.LowerBound, F23parameter.UpperBound);   %generate particle
    % Result of PSO and WAO
    [F23_PSO_hisGbest,F23_PSO_hisAverage,F23_PSO_gbestPosition,F23_PSO_iteration]=OA_PSO_min(@function23,F23population,F23parameter);
    [F23_WAO_hisGbest,F23_WAO_hisAverage,F23_WAO_gbestPosition,F23_WAO_iteration]=OA_WAO_min(@function23,F23population,F23parameter);
    [F23_BA_hisGbest,F23_BA_hisAverage,F23_BA_gbestPosition,F23_BA_iteration]=OA_BA_min(@function23,F23population,F23parameter);
    
    All_F23_PSO_gbestPosition(i,:)=F23_PSO_gbestPosition;
    All_F23_PSO_gbestFit(i)=F23_PSO_hisGbest(end);
    F23_PSO_Average_hisgbestFit=F23_PSO_Average_hisgbestFit+F23_PSO_hisGbest/Turn;
    F23_PSO_average_mean_hisAverage=F23_PSO_average_mean_hisAverage+F2_PSO_hisAverage(end)/Turn;
    
    All_F23_WAO_gbestPosition(i,:)=F23_WAO_gbestPosition;
    All_F23_WAO_gbestFit(i)=F23_WAO_hisGbest(end);
    F23_WAO_Average_hisgbestFit=F23_WAO_Average_hisgbestFit+F23_WAO_hisGbest/Turn;
    F23_WAO_average_mean_hisAverage=F23_WAO_average_mean_hisAverage+F23_PSO_hisAverage(end)/Turn;
    
    
    All_F23_BA_gbestPosition(i,:)=F23_BA_gbestPosition;
    All_F23_BA_gbestFit(i)=F23_BA_hisGbest(end);
    F23_BA_Average_hisgbestFit=F23_BA_Average_hisgbestFit+F23_BA_hisGbest/Turn;
    F23_BA_average_mean_hisAverage=F23_BA_average_mean_hisAverage+F23_BA_hisAverage(end)/Turn;

end  
    All_averageMeanPSO=[F2_PSO_average_mean_hisAverage,F5_PSO_average_mean_hisAverage,F8_PSO_average_mean_hisAverage,F10_PSO_average_mean_hisAverage,...
        F13_PSO_average_mean_hisAverage,F15_PSO_average_mean_hisAverage,F18_PSO_average_mean_hisAverage,F23_PSO_average_mean_hisAverage];
    All_averageMeanWAO=[F2_WAO_average_mean_hisAverage,F5_WAO_average_mean_hisAverage,F8_WAO_average_mean_hisAverage,F10_WAO_average_mean_hisAverage,...
        F13_WAO_average_mean_hisAverage,F15_WAO_average_mean_hisAverage,F18_WAO_average_mean_hisAverage,F23_WAO_average_mean_hisAverage];
    All_averageMeanBA=[F2_BA_average_mean_hisAverage,F5_BA_average_mean_hisAverage,F8_BA_average_mean_hisAverage,F10_BA_average_mean_hisAverage,...
        F13_BA_average_mean_hisAverage,F15_BA_average_mean_hisAverage,F18_BA_average_mean_hisAverage,F23_BA_average_mean_hisAverage];
%% PSO final Result %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [~,F2_PSO_bestIdx]=min(abs(All_F2_PSO_gbestFit));
    F2_PSO_gbest=All_F2_PSO_gbestFit(F2_PSO_bestIdx,1);
    
    [~,F5_PSO_bestIdx]=min(abs(All_F5_PSO_gbestFit));
    F5_PSO_gbest=All_F5_PSO_gbestFit(F5_PSO_bestIdx,1);
    
    [~,F8_PSO_bestIdx]=min(abs(  All_F8_PSO_gbestFit+12569.487*ones(Turn,1)  ));
    F8_PSO_gbest=All_F8_PSO_gbestFit(F8_PSO_bestIdx,1);
    
    [~,F10_PSO_bestIdx]=min(abs(All_F10_PSO_gbestFit));
    F10_PSO_gbest=All_F10_PSO_gbestFit(F10_PSO_bestIdx,1);
    
    [~,F13_PSO_bestIdx]=min(abs(All_F13_PSO_gbestFit));
    F13_PSO_gbest=All_F13_PSO_gbestFit(F13_PSO_bestIdx,1);
    
    [~,F15_PSO_bestIdx]=min(abs(  All_F15_PSO_gbestFit-0.0003*ones(Turn,1)  ));
    F15_PSO_gbest=All_F15_PSO_gbestFit(F15_PSO_bestIdx,1);
    
    [~,F18_PSO_bestIdx]=min(abs(  All_F18_PSO_gbestFit-3*ones(Turn,1)  ));
    F18_PSO_gbest=All_F18_PSO_gbestFit(F18_PSO_bestIdx,1);
    
    [~,F23_PSO_bestIdx]=min(abs(  All_F23_PSO_gbestFit+10.5363*ones(Turn,1)  ));
    F23_PSO_gbest=All_F23_PSO_gbestFit(F23_PSO_bestIdx,1);
    
    All_BestPSO=[F2_PSO_gbest,F5_PSO_gbest,F8_PSO_gbest,F10_PSO_gbest,F13_PSO_gbest,F15_PSO_gbest,F18_PSO_gbest,F23_PSO_gbest];

%% WAO Final Result%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [F2_WAO,F2_WAO_bestIdx]=min(abs(All_F2_WAO_gbestFit));
    F2_WAO_gbest=All_F2_WAO_gbestFit(F2_WAO_bestIdx,1);
    
    [F5_WAO,F5_WAO_bestIdx]=min(abs(All_F5_WAO_gbestFit));
    F5_WAO_gbest=All_F5_WAO_gbestFit(F5_WAO_bestIdx,1);
    
    [F8_WAO,F8_WAO_bestIdx]=min(abs(  All_F8_WAO_gbestFit+12569.487*ones(Turn,1)  ));
    F8_WAO_gbest=All_F8_WAO_gbestFit(F8_WAO_bestIdx,1);
    
    [F10_WAO,F10_WAO_bestIdx]=min(abs(All_F10_WAO_gbestFit));
    F10_WAO_gbest=All_F10_WAO_gbestFit(F10_WAO_bestIdx,1);
    
    [F13_WAO,F13_WAO_bestIdx]=min(abs(All_F13_WAO_gbestFit));
    F13_WAO_gbest=All_F13_WAO_gbestFit(F13_WAO_bestIdx,1);
    
    [F15_WAO,F15_WAO_bestIdx]=min(abs(  All_F15_WAO_gbestFit-0.0003*ones(Turn,1)  ));
    F15_WAO_gbest=All_F15_WAO_gbestFit(F15_WAO_bestIdx,1);
    
    [F18_WAO,F18_WAO_bestIdx]=min(abs(  All_F18_WAO_gbestFit-3*ones(Turn,1)  ));
    F18_WAO_gbest=All_F18_WAO_gbestFit(F18_WAO_bestIdx,1);
    
    [F23_WAO,F23_WAO_bestIdx]=min(abs(  All_F23_WAO_gbestFit+10.5363*ones(Turn,1)  ));
    F23_WAO_gbest=All_F23_WAO_gbestFit(F23_WAO_bestIdx,1);
    
    All_BestWAO=[F2_WAO_gbest,F5_WAO_gbest,F8_WAO_gbest,F10_WAO_gbest,F13_WAO_gbest,F15_WAO_gbest,F18_WAO_gbest,F23_WAO_gbest];

%% BA Final Result %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [F2_BA,F2_BA_bestIdx]=min(abs(All_F2_BA_gbestFit));
    F2_BA_gbest=All_F2_BA_gbestFit(F2_BA_bestIdx,1);
    
    [F5_BA,F5_BA_bestIdx]=min(abs(All_F5_BA_gbestFit));
    F5_BA_gbest=All_F5_BA_gbestFit(F5_BA_bestIdx,1);
    
    [F8_BA,F8_BA_bestIdx]=min(abs(  All_F8_BA_gbestFit+12569.487*ones(Turn,1)  ));
    F8_BA_gbest=All_F8_BA_gbestFit(F8_BA_bestIdx,1);
    
    [F10_BA,F10_BA_bestIdx]=min(abs(All_F10_BA_gbestFit));
    F10_BA_gbest=All_F10_BA_gbestFit(F10_BA_bestIdx,1);
    
    [F13_BA,F13_BA_bestIdx]=min(abs(All_F13_BA_gbestFit));
    F13_BA_gbest=All_F13_BA_gbestFit(F13_BA_bestIdx,1);
    
    [F15_BA,F15_BA_bestIdx]=min(abs(  All_F15_BA_gbestFit-0.0003*ones(Turn,1)  ));
    F15_BA_gbest=All_F15_BA_gbestFit(F15_BA_bestIdx,1);
    
    [F18_BA,F18_BA_bestIdx]=min(abs(  All_F18_BA_gbestFit-3*ones(Turn,1)  ));
    F18_BA_gbest=All_F18_BA_gbestFit(F18_BA_bestIdx,1);
    
    [F23_BA,F23_BA_bestIdx]=min(abs(  All_F23_BA_gbestFit+10.5363*ones(Turn,1)  ));
    F23_BA_gbest=All_F23_BA_gbestFit(F23_BA_bestIdx,1);
    
    All_BestBA=[F2_BA_gbest,F5_BA_gbest,F8_BA_gbest,F10_BA_gbest,F13_BA_gbest,F15_BA_gbest,F18_BA_gbest,F23_BA_gbest];

    
%% Plot 
figure(1)
hold on
grid on
plot(F2_PSO_iteration,F2_PSO_Average_hisgbestFit,'b','LineWidth',2)
legend('F2 PSO Average Gbest Value');
title('F2 PSO','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(2)
hold on
grid on
plot(F5_PSO_iteration,F5_PSO_Average_hisgbestFit,'b','LineWidth',2)
legend('F5 PSO Average Gbest Value');
title('F5 PSO','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(3)
hold on
grid on
plot(F8_PSO_iteration,F8_PSO_Average_hisgbestFit,'b','LineWidth',2)
legend('F8 PSO Average Gbest Value');
title('F8 PSO','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(4)
hold on
grid on
plot(F10_PSO_iteration,F10_PSO_Average_hisgbestFit,'b','LineWidth',2)
legend('F10 PSO Average Gbest Value');
title('F10 PSO','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(5)
hold on
grid on
plot(F13_PSO_iteration,F13_PSO_Average_hisgbestFit,'b','LineWidth',2)
legend('F13 PSO Average Gbest Value');
title('F13 PSO','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(6)
hold on
grid on
plot(F15_PSO_iteration,F15_PSO_Average_hisgbestFit,'b','LineWidth',2)
legend('F15 PSO Average Gbest Value');
title('F15 PSO','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(7)
hold on
grid on
plot(F18_PSO_iteration,F18_PSO_Average_hisgbestFit,'b','LineWidth',2)
legend('F18 PSO Average Gbest Value');
title('F18 PSO','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(8)
hold on
grid on
plot(F23_PSO_iteration,F23_PSO_Average_hisgbestFit,'b','LineWidth',2)
legend('F23 PSO Average Gbest Value');
title('F23 PSO','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off


%%

figure(9)
hold on
grid on
plot(F2_WAO_iteration,F2_WAO_Average_hisgbestFit,'b','LineWidth',2)
legend('F2 WAO Average Gbest Value');
title('F2 WAO','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(10)
hold on
grid on
plot(F5_WAO_iteration,F5_WAO_Average_hisgbestFit,'b','LineWidth',2)
legend('F5 WAO Average Gbest Value');
title('F5 WAO','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(11)
hold on
grid on
plot(F8_WAO_iteration,F8_WAO_Average_hisgbestFit,'b','LineWidth',2)
legend('F8 WAO Average Gbest Value');
title('F8 WAO','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(12)
hold on
grid on
plot(F10_WAO_iteration,F10_WAO_Average_hisgbestFit,'b','LineWidth',2)
legend('F10 WAO Average Gbest Value');
title('F10 WAO','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(13)
hold on
grid on
plot(F13_WAO_iteration,F13_WAO_Average_hisgbestFit,'b','LineWidth',2)
legend('F13 WAO Average Gbest Value');
title('F13 WAO','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(14)
hold on
grid on
plot(F15_WAO_iteration,F15_WAO_Average_hisgbestFit,'b','LineWidth',2)
legend('F15 WAO Average Gbest Value');
title('F15 WAO','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(15)
hold on
grid on
plot(F18_WAO_iteration,F18_WAO_Average_hisgbestFit,'b','LineWidth',2)
legend('F18 WAO Average Gbest Value');
title('F18 WAO','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(16)
hold on
grid on
plot(F23_WAO_iteration,F23_WAO_Average_hisgbestFit,'b','LineWidth',2)
legend('F23 WAO Average Gbest Value');
title('F23 WAO','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

%%

figure(17)
hold on
grid on
plot(F2_BA_iteration,F2_BA_Average_hisgbestFit,'b','LineWidth',2)
legend('F2 BA Average Gbest Value');
title('F2 BA','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(18)
hold on
grid on
plot(F5_BA_iteration,F5_BA_Average_hisgbestFit,'b','LineWidth',2)
legend('F5 BA Average Gbest Value');
title('F5 BA','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(19)
hold on
grid on
plot(F8_BA_iteration,F8_BA_Average_hisgbestFit,'b','LineWidth',2)
legend('F8 BA Average Gbest Value');
title('F8 BA','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(20)
hold on
grid on
plot(F10_BA_iteration,F10_BA_Average_hisgbestFit,'b','LineWidth',2)
legend('F10 BA Average Gbest Value');
title('F10 BA','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(21)
hold on
grid on
plot(F13_BA_iteration,F13_BA_Average_hisgbestFit,'b','LineWidth',2)
legend('F13 BA Average Gbest Value');
title('F13 BA','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(22)
hold on
grid on
plot(F15_BA_iteration,F15_BA_Average_hisgbestFit,'b','LineWidth',2)
legend('F15 BA Average Gbest Value');
title('F15 BA','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(23)
hold on
grid on
plot(F18_BA_iteration,F18_BA_Average_hisgbestFit,'b','LineWidth',2)
legend('F18 BA Average Gbest Value');
title('F18 BA','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(24)
hold on
grid on
plot(F23_BA_iteration,F23_BA_Average_hisgbestFit,'b','LineWidth',2)
legend('F23 BA Average Gbest Value');
title('F23 BA','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off



%% Comparation %%%%%%%%%%%%%%%%%%%%%%%%%


figure(25)
hold on
grid on
plot(F2_BA_iteration,F2_BA_Average_hisgbestFit,'g','LineWidth',2)
plot(F2_WAO_iteration,F2_WAO_Average_hisgbestFit,'b','LineWidth',2)
plot(F2_PSO_iteration,F2_PSO_Average_hisgbestFit,'r','LineWidth',2)

legend('BA','WAO','PSO');
title('Function 2 Comparation','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(26)
hold on
grid on
plot(F5_BA_iteration,F5_BA_Average_hisgbestFit,'g','LineWidth',2)
plot(F5_WAO_iteration,F5_WAO_Average_hisgbestFit,'b','LineWidth',2)
plot(F5_PSO_iteration,F5_PSO_Average_hisgbestFit,'r','LineWidth',2)

legend('BA','WAO','PSO');
title('Function 5 Comparation','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off

figure(27)
hold on
grid on
plot(F8_BA_iteration,F8_BA_Average_hisgbestFit,'g','LineWidth',2)
plot(F8_WAO_iteration,F8_WAO_Average_hisgbestFit,'b','LineWidth',2)
plot(F8_PSO_iteration,F8_PSO_Average_hisgbestFit,'r','LineWidth',2)

legend('BA','WAO','PSO');
title('Function 8 Comparation','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off


figure(28)
hold on
grid on
plot(F10_BA_iteration,F10_BA_Average_hisgbestFit,'g','LineWidth',2)
plot(F10_WAO_iteration,F10_WAO_Average_hisgbestFit,'b','LineWidth',2)
plot(F10_PSO_iteration,F10_PSO_Average_hisgbestFit,'r','LineWidth',2)

legend('BA','WAO','PSO');
title('Function 10 Comparation','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off


figure(29)
hold on
grid on
plot(F13_BA_iteration,F13_BA_Average_hisgbestFit,'g','LineWidth',2)
plot(F13_WAO_iteration,F13_WAO_Average_hisgbestFit,'b','LineWidth',2)
plot(F13_PSO_iteration,F13_PSO_Average_hisgbestFit,'r','LineWidth',2)

legend('BA','WAO','PSO');
title('Function 13 Comparation','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off


figure(30)
hold on
grid on
plot(F15_BA_iteration,F15_BA_Average_hisgbestFit,'g','LineWidth',2)
plot(F15_WAO_iteration,F15_WAO_Average_hisgbestFit,'b','LineWidth',2)
plot(F15_PSO_iteration,F15_PSO_Average_hisgbestFit,'r','LineWidth',2)

legend('BA','WAO','PSO');
title('Function 15 Comparation','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off


figure(31)
hold on
grid on
plot(F18_BA_iteration,F18_BA_Average_hisgbestFit,'g','LineWidth',2)
plot(F18_WAO_iteration,F18_WAO_Average_hisgbestFit,'b','LineWidth',2)
plot(F18_PSO_iteration,F18_PSO_Average_hisgbestFit,'r','LineWidth',2)

legend('BA','WAO','PSO');
title('Function 18 Comparation','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off


figure(32)
hold on
grid on
plot(F23_BA_iteration,F23_BA_Average_hisgbestFit,'g','LineWidth',2)
plot(F23_WAO_iteration,F23_WAO_Average_hisgbestFit,'b','LineWidth',2)
plot(F23_PSO_iteration,F23_PSO_Average_hisgbestFit,'r','LineWidth',2)

legend('BA','WAO','PSO');
title('Function 23 Comparation','fontname','times new roman','Fontangle','italic','FontSize',14);
xlabel('Iteration','fontname','times new roman','Fontangle','italic','FontSize',14);   
ylabel('Fitness Value','fontname','times new roman','Fontangle','italic','FontSize',14);
hold off


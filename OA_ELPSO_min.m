function [hisGbest,hisAverage,gbestPosition,iteration,M1,M2,M3,M4,M5]=OA_ELPSO_min(Fun,population,parameter)
%% User modification is provided here%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

UB=parameter.UpperBound;
LB=parameter.LowerBound;
w=0.9;   %Particles weights
c1=parameter.c1;   %pbest weights
c2=parameter.c2;   %gbest weights
itertime=parameter.itertime;   %Iteration times
particle=population;   %The parameter is for every particle's position and gives the initial value for them
aaa=size(particle);
parnumber=aaa(1);
Dim=aaa(2);
F=1.2;   %scale factor of DE-based mutation is 1.2
s=2;   %scale parameter of Cauchy mutation is 2
h=1;   % h is standard deviation ofGaussian distribution.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initial value %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=1;
M1=0;
M2=0;
M3=0;
M4=0;
M5=0;
pbest=particle;   %The parameter is for each particle's pbest
Vn=10*rand(parnumber,Dim);  %The parameter is for velocity and  initializes the velocity for each particle
fitnessValue=zeros(parnumber,1);   %The parameter is for fitness value


for i=1:parnumber
    fitnessValue(i,1)=Fun(particle(i,:));   %Evaluate fitness value for each particle
    
end
[gbestFit,idx]=min(fitnessValue);   %Find the less value for first times (for minimum case)
gbestPosition=particle(idx,:);
hisGbest(t)=gbestFit;   %History of gbest position
averageFit=sum(fitnessValue(:,1))/parnumber;
hisAverage(t)=averageFit;
iteration=zeros(1,itertime);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Calculate start%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while t<=itertime
    for i=1:parnumber
        Rdnb_p=c1*rand(1,Dim);   %The pbest weights
        Rdnb_g=c2*rand(1,Dim);   %The gbest weights
        fitnessValue(i,1)=Fun(particle(i,:));   %Each fitness value of each particle
        if gbestFit>fitnessValue(i,1)   %Judge the gbest position
            gbestPosition=particle(i,:);
            gbestFit=fitnessValue(i,1);
        end
        if (Fun(pbest(i,:)))>fitnessValue(i,1)   %Judge the gbest position
            pbest(i,:)=particle(i,:);
        end
        %Evaluate next time velocity
        Vn(i,:)=w*Vn(i,:)+Rdnb_p.*(pbest(i,:)-particle(i,:))+Rdnb_g.*(gbestPosition-particle(i,:));
        particle(i,:)=particle(i,:)+Vn(i,:);   %move particles
        
        %         for i2=1:parnumber
        %             for j2=1:Dim
        %                 if particle(i2,j2)>UB
        %                     particle(i2,j2)=UB;
        %                 end
        %                 if particle(i2,j2)<LB
        %                     particle(i2,j2)=LB;
        %                 end
        %             end
        %         end
        
        
    end
    averageFit=sum(fitnessValue(:,1))/parnumber;
    hisAverage(t)=averageFit;
    
    
    %% Mutation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    PG1=gbestPosition+(UB-LB)*(2*rand(1,Dim)-ones(1,Dim))*normpdf(h,0,1);   %A standard Gaussian distribution  mu=0   sigma=1   normrnd(mu,sigma,sz)
    PG1FIT=Fun(PG1);
    if gbestFit>PG1FIT
        M1=M1+1;
        gbestPosition=PG1;
        gbestFit=PG1FIT;
    end
    h=h-1/itertime;
    % Cauchy
    
    PG2=gbestPosition-(UB-LB)*(2*rand(1,Dim)-ones(1,Dim))*trnd(s,1,1);
    PG2FIT=Fun(PG2);
    if gbestFit>PG2FIT
        M2=M2+1;
        gbestPosition=PG2;
        gbestFit=PG2FIT;
    end
    s=s-1/itertime;
    %
    PG3=-gbestPosition+(UB+LB)*(2*rand(1,Dim)-ones(1,Dim));
    PG3FIT=Fun(PG3);
    if gbestFit>PG3FIT
        M3=M3+1;
        gbestPosition=PG3;
        gbestFit=PG3FIT;
    end
    PG4=gbestPosition+0.01*(2*rand(1,Dim)-ones(1,Dim));
    PG4FIT=Fun(PG4);
    if gbestFit>PG3FIT
        M4=M4+1;
        gbestPosition=PG4;
        gbestFit=PG4FIT;
    end
    %
    rr=ceil(parnumber*rand);
    ss=ceil(parnumber*rand);
    while rr==ss
        ss=ceil(parnumber*rand);
    end
    PG5=gbestPosition+F*(particle(rr,:)-particle(ss,:));
    PG5FIT=Fun(PG5);
    if gbestFit>PG5FIT
        M5=M5+1;
        gbestPosition=PG5;
        gbestFit=PG5FIT;
    end
    
    
    hisGbest(t)=gbestFit;
    w=w-(0.9-0.4)/itertime;
    
    
    
    
    
    
    
    %% Limit Particle for Bound %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %     for i2=1:parnumber
    %         for j2=1:Dim
    %             if particle(i2,j2)>UB
    %                 particle(i2,j2)=UB;
    %             end
    %             if particle(i2,j2)<LB
    %                 particle(i2,j2)=LB;
    %             end
    %         end
    %     end
    %% Record Valoue %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    iteration(t)=t;
    
    
    
    t=t+1;
end
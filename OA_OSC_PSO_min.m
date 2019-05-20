function [hisGbest,hisAverage,gbestPosition,iteration]=OA_OSC_PSO_min(Fun,population,parameter)
%% User modification is provided here%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

UB=parameter.UpperBound;
LB=parameter.LowerBound;
W_init=1.1;  %給定一開始的慣性值1.1
W_end=0.1;  %給定最後的慣性值0.1   
c1=parameter.c1;   %pbest weights
c2=parameter.c2;   %gbest weights
itertime=parameter.itertime;   %Iteration times
particle=population;   %The parameter is for every particle's position and gives the initial value for them
aaa=size(particle);
parnumber=aaa(1);
Dim=aaa(2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initial value %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=1; 

pbest=particle;   %The parameter is for each particle's pbest
Vn=10*rand(parnumber,Dim)-1;  %The parameter is for velocity and  initializes the velocity for each particle
fitnessValue=zeros(parnumber,1);   %The parameter is for fitness value
hisParticle=zeros(parnumber,Dim);   %The parameter is for record the particle v

for i=1:parnumber
    fitnessValue(i,1)=Fun(particle(i,:));   %Evaluate fitness value for each particle
    hisParticle(i,:)=particle(i,:);   %Record the particle position
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
W=W_init-(W_init-W_end)*t/(itertime);  %%Particles weights 
w=normrnd(W,W);
    for i=1:parnumber
        Rdnb_p=c1*rand(1,Dim);   %The pbest weights
        Rdnb_g=c1-Rdnb_p;   %The gbest weights
        fitnessValue(i,1)=Fun(particle(i,:));   %Each fitness value of each particle
        hisParticle(i,:)=particle(i,:);   %
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
    end
    %% Limit Particle for Bound %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for i2=1:parnumber
        for j2=1:Dim
            if particle(i2,j2)>UB
                particle(i2,j2)=UB;
            end
            if particle(i2,j2)<LB
                particle(i2,j2)=LB;
            end
        end
    end
    %% Record Valoue %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    iteration(t)=t;

    [gbestFit,idx]=min(fitnessValue);   %Find the less value for first times 
    gbestPosition=particle(idx,:);
    hisGbest(t)=gbestFit;
    averageFit=sum(fitnessValue(:,1))/parnumber;
    hisAverage(t)=averageFit;

    t=t+1;
end



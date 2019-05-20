function [hisGbest,hisAverage,gbestPosition,iteration]=OA_PSO_min(Fun,population,parameter)
%% User modification is provided here%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

UB=parameter.UpperBound;
LB=parameter.LowerBound;

c1=parameter.c1;   %pbest weights
c2=parameter.c2;   %gbest weights
itertime=parameter.itertime;   %Iteration times
particle=population;   %The parameter is for every particle's position and gives the initial value for them
aaa=size(particle);
parnumber=aaa(1);
Dim=aaa(2);
w=0.9;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initial value %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=1;

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
    w=w-(0.9-0.4)/itertime;
    
    hisGbest(t)=gbestFit;
    averageFit=sum(fitnessValue(:,1))/parnumber;
    hisAverage(t)=averageFit;
    
    t=t+1;
end



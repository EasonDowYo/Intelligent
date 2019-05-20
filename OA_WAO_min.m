function [hisGbest,hisAverage,gbestPosition,iteration]=OA_WAO_min(Fun,population,parameter)
%% User modification is provided here%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
UB=parameter.UpperBound;
LB=parameter.LowerBound;
itertime=parameter.itertime;   %Iteration times
particle=population;
aaa=size(particle);
parnumber=aaa(1);
Dim=aaa(2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a=linspace(2,0,itertime);
b=1;
t=1;
fitnessValue=zeros(parnumber,1);   %Fitness value
hisGbest=zeros(1,itertime);   %History of gbest position

for i=1:parnumber
    fitnessValue(i,1)=Fun(particle(i,:));   %Evaluate fitness value for each particle
end
[gbestFit,idx]=min(fitnessValue);   %Find the less value for first times (for minimum case)
gbestPosition=particle(idx,:);
hisGbest(t)=gbestFit;
averageFit=sum(fitnessValue(:,1))/parnumber;
hisAverage(t)=averageFit;
iteration=zeros(1,itertime);

%% WAO start %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for t=1:itertime
    for i=1:parnumber
        r=rand(1,Dim);
        A=a(t)*r+a(t)*rand(1,Dim);
        C=2*r;

        l=2*rand-1;
        p=rand;
        if p<0.5
            if norm(A)<1
                D=abs(C.*gbestPosition-particle(i,:));
                particle(i,:)=gbestPosition-A.*D;
            elseif norm(A)>=1
                Xrand=20*rand(1,Dim)-10*ones(1,Dim);
                D=abs(C.*Xrand-particle(i,:));
                particle(i,:)=Xrand-A.*D;
            end
        elseif p>=0.5
            Dprime=abs(gbestPosition-particle(i,:));
            particle(i,:)=exp(b*l)*cos(2*pi*l)*Dprime+gbestPosition;
        end

    end % end (for i=1:parnumber)
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
    for i=1:parnumber
        fitnessValue(i,1)=Fun(particle(i,:));   %Evaluate fitness value for each particle
        if gbestFit>fitnessValue(i,1)
            gbestPosition=particle(i,:);
            gbestFit=fitnessValue(i,1);
        end
    end
    temp=fitnessValue;
    for i=1:floor(parnumber/10)
        [~,idx2]=max(temp);
        D=abs(C.*gbestPosition-particle(idx2,:));
        particle(idx2,:)=gbestPosition-A.*D;
        temp(idx2)=0;
    end

%% Record Valoue %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    hisGbest(t)=gbestFit;
    averageFit=sum(fitnessValue(:,1))/parnumber;
    hisAverage(t)=averageFit;
    iteration(t)=t;
    
end
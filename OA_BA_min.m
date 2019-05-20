function [hisGbest,hisAverage,gbestPosition,iteration]=OA_BA_min(Fun,population,parameter)
%% User modification is provided here%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
particle=population;   %The parameter is for every particle's position and gives the initial value for them
aaa=size(particle);
parnumber=aaa(1);
Dim=aaa(2);
itertime=parameter.itertime;   % Maximum of itertime
UB=parameter.UpperBound;
LB=parameter.LowerBound;
A0=parameter.A0;

arpha=parameter.arpha;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Algorithm parameter %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Qmin=0;   % Frequency minimum
Qmax=2;   % Frequency maximum
F=rand;
Cr=rand;

A=A0;
r=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Q=zeros(parnumber,1);   % Frequency
v=zeros(parnumber,Dim);   % Velocities

iteration=zeros(1,itertime);
fitnessValue=zeros(parnumber,1);   %The parameter is for fitness value

t=1;
for i=1:parnumber
  fitnessValue(i)=Fun(particle(i,:));
end

[gbestFit,Idx]=min(fitnessValue);
gbestPosition=particle(Idx,:);
hisGbest(t)=gbestFit;   %History of gbest position
averageFit=sum(fitnessValue(:,1))/parnumber;
hisAverage(t)=averageFit;

%% BA start  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for t=1:itertime
        for i=1:parnumber
            Q(i)=Qmin+(Qmin-Qmax)*rand;
            v(i,:)=v(i,:)+(particle(i,:)-gbestPosition)*Q(i);
            particle(i,:)=particle(i,:)+v(i,:);
            %
            if rand>r 
                xu=gbestPosition+0.5*(2*rand-1)*ones(1,Dim);
            else
                xu=particle(i,:);
            end
            a=ceil(parnumber*rand);
            b=ceil(parnumber*rand);
            c=ceil(parnumber*rand);
            while ( (a==i)||(b==i)||(c==i) )
                a=ceil(parnumber*rand);
                b=ceil(parnumber*rand);
                c=ceil(parnumber*rand);
            end
            jr=ceil(Dim*rand);
            for j=1:Dim
                if ( (j==jr) || rand<=Cr)
                    xd=particle(c,:)+F*(particle(a,:)-particle(b,:));
                else
                    xd=particle(i,:);
                end
            end
            xuFit=Fun(xu);
            xiFit=Fun(particle(i,:));
            xdFit=Fun(xd);
            xlbFit=min([xuFit,xiFit,xdFit]);
            
            if (rand<A) && (xiFit<xlbFit)
                
                A=A*arpha;
                r=r-r*t/itertime;
            end
            
        end
        F=rand;
        Cr=rand;
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
        for i=1:parnumber
            fitnessValue(i)=Fun(particle(i,:));
            if fitnessValue(i)<gbestFit
                gbestPosition=particle(i,:);
                gbestFit=fitnessValue(i);
            end
        end

        hisGbest(t)=gbestFit;%History of gbest position
        averageFit=sum(fitnessValue(:,1))/parnumber;
        hisAverage(t)=averageFit;
        iteration(t)=t;
end



















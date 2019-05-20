function [best,fmin,N_iter]=bat_a(para)

% Default parameters
if nargin<1,  para=[20 1000 0.5 0.5];  end
n=para(1);      % Population size, typically 10 to 40
N_gen=para(2);  % Number of generations
A=para(3);      % Loudness  (constant or decreasing)
r=para(4);      % Pulse rate (constant or decreasing)
% This frequency range determines the scalings
% You should change these values if necessary
Qmin=0;         % Frequency minimum
Qmax=2;         % Frequency maximum
% Iteration parameters
N_iter=0;       % Total number of function evaluations
% Dimension of the search variables
d=30;           % Number of dimensions 
% Lower limit/bounds/ a vector
Lb=-2*ones(1,d);
% Upper limit/bounds/ a vector
Ub=2*ones(1,d);
% Initializing arrays
Q=zeros(n,1);   % Frequency
v=zeros(n,d);   % Velocities
% Initialize the population/solutions
for i=1:n
  Sol(i,:)=Lb+(Ub-Lb).*rand(1,d);
  Fitness(i)=Fun(Sol(i,:));
end
% Find the initial best solution
[fmin,I]=min(Fitness);
best=Sol(I,:);
% ======================================================  %
% Note: As this is a demo, here we did not implement the  %
% reduction of loudness and increase of emission rates.   %
% Interested readers can do some parametric studies       %
% and also implementation various changes of A and r etc  %
% ======================================================  %
% Start the iterations -- Bat Algorithm (essential part)  %
for t=1:N_gen
% Loop over all bats/solutions
        for i=1:n
          Q(i)=Qmin+(Qmin-Qmax)*rand;
          v(i,:)=v(i,:)+(Sol(i,:)-best)*Q(i);
          S(i,:)=Sol(i,:)+v(i,:);
          % Apply simple bounds/limits
          Sol(i,:)=simplebounds(Sol(i,:),Lb,Ub);
          % Pulse rate
          if rand>r
          % The factor 0.001 limits the step sizes of random walks 
              S(i,:)=best+0.001*randn(1,d);
          end
     % Evaluate new solutions
           Fnew=Fun(S(i,:));
     % Update if the solution improves, or not too loud
           if (Fnew<=Fitness(i)) && (rand<A) 
                Sol(i,:)=S(i,:);
                Fitness(i)=Fnew;
           end
          % Update the current best solution
          if Fnew<=fmin
                best=S(i,:);
                fmin=Fnew;
          end
        end
        N_iter=N_iter+n;
end
% Output/display
disp(['Number of evaluations: ',num2str(N_iter)]);
disp(['Best =',num2str(best)]);
disp(['fmin=',num2str(fmin)]);
% Application of simple limits/bounds
function s=simplebounds(s,Lb,Ub)
  % Apply the lower bound vector
  ns_tmp=s;
  I=ns_tmp<Lb;
  ns_tmp(I)=Lb(I);
  
  % Apply the upper bound vector 
  J=ns_tmp>Ub;
  ns_tmp(J)=Ub(J);
  % Update this new move 
  s=ns_tmp;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Objective function: your own objective function can be written here
% Note: When you use your own function, please remember to 
%       change limits/bounds Lb and Ub (see lines 52 to 55) 
%       and the number of dimension d (see line 51). 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function z=Fun(u)
m=size(u);
sum_x=0;
for i=1:(m(2)-1)
    f=(100*(u(i+1)-u(i)^2)^2+(u(i)-1)^2);
	sum_x=sum_x+f;
end
z=sum_x;
%%%%% ============ end ====================================
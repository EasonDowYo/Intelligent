function fitnessValue=function2(particle)
sum_x=0;
multiply_x=1;
for i=particle
	sum_x=sum_x+abs(i);
    multiply_x=multiply_x*abs(i);
end

fitnessValue=sum_x+multiply_x;
% fitnessValue=particle^2;
end
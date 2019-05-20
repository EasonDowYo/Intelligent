function ptc=generatePTC(number,Dim,LowerBound,UpperBound)
if (LowerBound==0)
    ptc=UpperBound*rand(number,Dim);
else
    ptc=(UpperBound-LowerBound)*rand(number,Dim)-(UpperBound-LowerBound)/2*ones(number,Dim);
end

end


clc;clear;close;



str='F';
fn=[2 5 10 13 15 18 23];
sz=size(fn);

for i=1:sz(2)
    eval( strcat( 'F' ,num2str(fn(i)),'=',num2str(i) ) );
    clc;
end
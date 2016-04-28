%TRYTHIS  creates and saves two variables.      
%
% Used to test REMOTERUNNER. Put TRYTHIS in the 
% folder where REMOTERUNNER is runnung. The output
% from TRYTHIS is found in the folder SAVINGS.
%
% Andreas Carlberger
% 2016-01-24

name = 64+randi(26,1,3);
value = rand(30);
num = num2str(round(sum(sum(value))));

string = sprintf('Savings/tryThis_%s_%s',num,name);
save(string,'name','value')
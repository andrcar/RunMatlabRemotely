%REMOTERUNNER  Runs provided scripts. v0.5 - 2016-04-13
%
% Runs all files in the same folder. Run scripts on
% inaccessible systems by putting the script in the
% folder where REMOTERUNNER is runnung.
%
% If non-existent a "Savings" folder will be created.
% The folowing lines can be used to save variables:
% >> str = sprintf('Savings/%s.mat',name);
% >> save(str,'variable1','variable2')
% Do not clear variables inside run scripts.
%
% Andreas Carlberger
% 2016-01-29

try
  
  clear
  clc
  
  % --- parameters ---
  checkFreq = 10;
  finTime = -1;   % in hours. -1 = inf
  
  % --- initiation ---
  finTimeS = finTime*3600;
  if finTime == -1
    finTimeS = inf;
  end
  timeA = tic;
  runTime = 0;
  myName = prod(double('RemoteRunner.m'));
  
  originalDir = dir;
  tmp = exist('Savings');
  
  if tmp ~= 7
    mkdir('Savings')
  end
  
  counter = 0;
  while runTime < finTimeS
    counter = counter+1;
    fprintf('\n check nr: %d \n',counter)
    
    pause(checkFreq)
    clc
    
    directory = dir;
    nFiles = length(directory);
    
    for ii = 1:nFiles
      try
        disp(directory(ii).name)
        if directory(ii).isdir == 0 ...
            && prod(double(directory(ii).name)) ~= myName
          try
            run(directory(ii).name)
          catch
            a = 1;
          end
        end
      catch
        a = 2;
      end
      close all
    end
    
    runTime = toc(timeA);
  end
  fprintf('\n check nr: %d \n runtime: %.2f h\n',counter,runTime/3600)
  
catch
  fprintf('\n Failed to evalulate current script \n')
  pause(5)
  RemoteRunner
  
end
tic
clear
clc

PWD=pwd;
RESULT='results';
CONC='conclusion';
if exist(CONC) == 7
    rmdir(CONC,'s');
    mkdir(sprintf('%s',CONC));
else
    mkdir(sprintf('%s',CONC));
end
MAX_DISP=[];
FOLDERS=ls('results');
FOLDERS=FOLDERS([3:end],:);
SIZE_FOLDERS=size(FOLDERS,1);
I=1;

for i=1:2 
        FILE=sprintf('%s\\%s\\output.dat.dna',RESULT,strtrim(FOLDERS(i,:)));
        disp(strcat(num2str(i),'::',FILE))
        OUT_RESULT=genRESULT(FILE)

end
toc
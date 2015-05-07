tic
clear
clc
OUT=[];

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
FOLDERS=ls(RESULT);
FOLDERS=FOLDERS([3:end],:);
SIZE_FOLDERS=size(FOLDERS,1);
I=1;

for i=1:SIZE_FOLDERS 
        FILE=sprintf('%s\\%s\\output.dat.dna',RESULT,strtrim(FOLDERS(i,:)));
        disp(strcat(num2str(i),'::',FILE))
        try
            OUT_RESULT=genRESULT(FILE)
%           OUT_RESULT=[ 1 1 1];
            OUT=[OUT ; OUT_RESULT];
        catch
            OUT=[OUT ; [0,0,0] ];
        end
end

save OUT

toc
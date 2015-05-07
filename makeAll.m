tic
clear
clc

PWD=pwd;
RESULT='results';
if exist(RESULT) == 7
    rmdir(RESULT,'s');
    mkdir(sprintf('%s',RESULT));
else
    mkdir(sprintf('%s',RESULT));
end
R_RANGE=75:15:300;
H_RANGE=40:10:80;
RH_SIZE=size(R_RANGE,2)*size(H_RANGE,2);

I=1;

for R=R_RANGE
    for H=H_RANGE
        I=I+1;
        FOLDER=sprintf('%s\\H%iR%i',RESULT,H,R);
        mkdir(FOLDER);
        copyfile('command.dcf',FOLDER)
        copyfile('main.dat',FOLDER)
        copyfile('dialogin.bat',FOLDER)
        cd(FOLDER)
        [status, result]=system('C:\Windows\system32\cmd.exe /K "dialogin.bat"');
        disp(sprintf('%3.1f',I/RH_SIZE*100))
        cd ../..
        %                 myfile=['file:///'
        %fullfile(x,'myFile.txt')];system('C:\Windows\system32\cmd.exe /K "dialogin.bat"');
    end
end
toc
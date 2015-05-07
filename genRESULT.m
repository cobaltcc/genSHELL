function [ MAX_DISP ] = genRESULT( FILE )
%GENRESULT Summary of this function goes here
%   Detailed explanation goes here
fid = fopen(FILE);
if fid == -1
   disp(strcat(FOLDER,'.... FAILED'))
end
MAX_DISP=[];
line = 1;
isOutput = 0;
loadStep = 0;
matrix=[];
tline = fgetl(fid);
SEARCH_TERM='Total Displacements';

while ischar(tline)
    if strcmp(tline, SEARCH_TERM)
        if strcmp(SEARCH_TERM,'Total Displacements')
            loadStep = loadStep+1;
%             disp('Disp found')
            SEARCH_TERM='Output';
            tline = fgetl(fid);
            continue
        elseif strcmp(SEARCH_TERM,'Output')
            disp('Output found')
            SEARCH_TERM='Total Displacements';
            tline = fgetl(fid);
            while str2num(tline)
                node = str2num(tline);
                tline = fgetl(fid);
                X=str2num(tline);
                tline = fgetl(fid);
                Y=str2num(tline);
                tline = fgetl(fid);
                Z=str2num(tline);
                tline = fgetl(fid);
               
                matrix = [matrix; node; X ; Y ; Z];

            end
            matrix=reshape(matrix,4,[]);
            matrix=matrix';
            matrix(:,1)=[];
            MAX_DISP=[MAX_DISP; max(matrix)];
            matrix=[];
            disp(strcat(num2str(loadStep),'::','MAX CREATED'))
            continue
        end
    else
        tline = fgetl(fid);
    end
    
end


end



%         if isOutput > 1
%            matrix=reshape(matrix,4,[]);
%            matrix=matrix';
%            matrix(:,1)=[];
%            MAX_DISP=max(matrix);
%            return 
%         end
%     elseif isOutput == 1
% %               disp(tline)
%         variable=str2num(tline);
%         if isempty(variable)
%            isOutput = isOutput+1;
%         end
%         matrix = [matrix; variable];
%         line = 1;
%         tline = fgetl(fid);
%     else
%         tline = fgetl(fid);
%     end
% end

% 
% function seachTD(fid)
% %     if (strcmp(tline, )) && (isOutput==0)
% %         loadStep = loadStep+1;
% %     end
% end
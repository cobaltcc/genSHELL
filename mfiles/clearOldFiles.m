function clearOldFiles()

%% Delete old output file
% This clears old files
if exist('../Output') == 0
    mkdir '../Output';
end
delete('../Output/*.dat')
delete('../Output/*.dcf')

end
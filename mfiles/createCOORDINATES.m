function createCOORDINATES()
disp(sprintf('''COORDINATES'''));
%    1  1.44000E+003 -1.44672E-029  0.00000E+000
%    2  1.45200E+003  3.42118E-029  0.00000E+000
%    3  1.44000E+003 -1.44672E-029 -2.00000E+001
%    4  1.45200E+003  3.42118E-029 -2.00000E+001
%    5  1.44000E+003 -1.44672E-029 -4.00000E+001

load inputDataFile;

ringN = floor(shaftDepth/segmentHeight);

[NODES, ELEMENTS]= ELM_createElements(shaftRadius,springToWall,segmentLength,segmentGap,segmentHeight,segmentAngle,ringN,colors);

save('NODES','NODES');
save('ELEMENTS','ELEMENTS');

for i =1 : size(NODES,1)
    disp(sprintf('   %i %3.4E %3.4E %3.4E',NODES(i,1),NODES(i,2),NODES(i,3),NODES(i,4)));
end




end






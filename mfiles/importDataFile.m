function importDataFile()

[inputShaftNum,inputShaftText] = xlsread('../Inputs/input.xlsx','shaft');
[inputPropNum,inputPropText] = xlsread('../Inputs/input.xlsx','Prop');
caseNumber = inputShaftNum(1);
modelNumber = inputShaftNum(2);
shaftRadius = inputShaftNum(3);
shaftDepth = inputShaftNum(4);
segmentGap = inputShaftNum(5);
segmentLength = inputShaftNum(6);
segmentAngle = inputShaftNum(7);
bucklingFactor = inputShaftNum(8);
pressureProfile = inputShaftNum(9);

propConcreteYoung = inputPropNum(1,1);
propConcretePoision = inputPropNum(1,2);
propConcreteDensi = inputPropNum(1,3);
propGroundmodYoung = inputPropNum(2,1);
propGroundmodPoision = inputPropNum(2,2);

springToWall = inputShaftNum(15);
segmentHeight = inputShaftNum(16);


% colors= [color_SEG,color_SPR,color_VJ,color_HJ];
colors= [inputShaftText(11,2),inputShaftText(12,2),inputShaftText(13,2),inputShaftText(14,2)];
colors= cell2mat(colors);
clearvars inputShaftNum inputShaftText inputPropNum inputPropText;

save('inputDataFile');

end
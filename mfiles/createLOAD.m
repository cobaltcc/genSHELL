function createLOAD()
% 'LOADS'
% CASE 1
% ELEMEN
% 27590 FACE  ZETA2
%      FORCE  -1.00094E+000 -1.00210E+000 -1.00374E+000 -1.00374E+000 
%             -1.00374E+000 -1.00210E+000 -1.00094E+000 -1.00094E+000
%      DIRELM NORMAL
% 27589 FACE  ZETA2
%      FORCE  -1.00000E+000 -1.00023E+000 -1.00094E+000 -1.00094E+000 
%             -1.00094E+000 -1.00023E+000 -1.00000E+000 -1.00000E+000
%      DIRELM NORMAL
load inputDataFile;


RADIUS_HIG=shaftRadius++1;
R=RADIUS_HIG;
RADIUS_LOW=shaftRadius+-1;

disp(sprintf('''LOADS'''));
disp(sprintf('CASE 1'));
disp(sprintf('ELEMEN'));

[currentELEM] = searchELEM(1);
[row, col] = size(currentELEM);
[elemX, elemY, elemZ]=getElementXYZ(currentELEM);
newelemZ=18+(abs(round(elemZ-2.5)/5))*16;
loadXYZ=newelemZ.*(1+0.5*sqrt(R*R-elemX.*elemX)/R);

L1=loadXYZ;
L2=loadXYZ;
L3=loadXYZ;
L4=loadXYZ+7;
L5=loadXYZ+14;
L6=loadXYZ+14;
L7=loadXYZ+14;
L8=loadXYZ+7;
loopSize = row;
for i = 1:loopSize
disp(sprintf('  %i   FACE',currentELEM(i)));
% disp(sprintf('      FORCE %i',loadXYZ(i)));
disp(sprintf('      FORCE %i %i %i %i %i %i %i %i',L1(i),L2(i),L3(i),L4(i),L5(i),L6(i),L7(i),L8(i)));
disp(sprintf('      DIRELM Z'));


%     if rem(i,10) ~= 0
%         string2 = sprintf('%s %i',string2,currentNODE(i));
%     else
%         string2 = sprintf('%s %i\n',string2,currentNODE(i));
%     end
end
%string2 = strcat(string2,' / TR 3');
%disp(string2);

end
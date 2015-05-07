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
loadXYZ=((abs(floor(elemZ/5))+1).*(1+0.5*sqrt(R*R-elemX.*elemX)/R));
MULTI=55/5.5;
L1=MULTI*(loadXYZ/8);
L2=MULTI*(loadXYZ/8);
L3=MULTI*(loadXYZ/8);
L4=MULTI*(1/16+loadXYZ/8);
L5=MULTI*(1/8+loadXYZ/8);
L6=MULTI*(1/8+loadXYZ/8);
L7=MULTI*(1/8+loadXYZ/8);
L8=MULTI*(1/16+loadXYZ/8);
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
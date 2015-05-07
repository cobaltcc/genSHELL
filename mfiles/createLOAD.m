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
RADIUS_LOW=shaftRadius+-1;

disp(sprintf('''LOADS'''));
disp(sprintf('CASE 1'));
disp(sprintf('ELEMEN'));

[currentELEM] = searchELEM(1);
[row, col] = size(currentELEM);
loopSize = row;
for i = 1:loopSize
disp(sprintf('  %i   FACE',currentELEM(i)));
disp(sprintf('      FORCE 1.0'));
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
function createMATERI()
% 

load inputDataFile.mat

disp(sprintf('''MATERI'''));
disp(sprintf('   1 NAME   "Concrete"'));
disp(sprintf('     YOUNG   %3.4E',7.20000E+08));
disp(sprintf('     POISON  %3.4E',2.50000E-01));
%disp(sprintf('     DENSIT  %3.4E',propConcreteDensi));
disp(sprintf('   2 NAME   "SoilIF"'));
disp(sprintf('     DSTIF   1.38240E+05   1.72800E+03'));
disp(sprintf('     SIGDIS  -5.76000E+06  -4.16667E+01  0.00000E+000  0.00000E+000')); 
disp(sprintf('             1.44000E+02   8.33333E+01'));
% disp(sprintf('   3 NAME   "VerticalJoint_IF"'));
% disp(sprintf('     DSTIF   1.00000E+003  1.00000E+003'));
% disp(sprintf('     SIGDIS -1.00000E+016 -1.00000E+003 -2.76000E+004 -1.20000E-001'));
% disp(sprintf('             0.00000E+000  0.00000E+000  4.55000E+004  1.00000E+003'));
% disp(sprintf('     TAUDIS -3.75000E+001 -1.00000E+006 -3.20000E+001 -2.70000E-001'));
% disp(sprintf('            -1.95000E+001 -1.00000E-001  0.00000E+000  0.00000E+000')); 
% disp(sprintf('             1.95000E+001  1.00000E-001  3.20000E+001  2.70000E-001')); 
% disp(sprintf('             3.75000E+001  1.00000E+006'));
disp(sprintf('   3 NAME   "JointIF"'));
disp(sprintf('     DSTIF   3.97440E+08   1.58976E+08'));
disp(sprintf('     SIGDIS -1.44000E+18  -8.33433E+01  -3.97440E+06  -1.00000E-02'));
disp(sprintf('             0.00000E+00   0.00000E+00   6.55200E+06   8.33333E+01'));
disp(sprintf('     TAUDIS  -8.64000E+03  -8.33333E+04  -7.93440E+03  -4.16925E-02'));
disp(sprintf('             -3.97440E+03  -2.58333E-05   0.00000E+00   0.00000E+00'));
disp(sprintf('             3.97440E+03   2.58333E-05   7.93440E+03   4.16925E-02'));
disp(sprintf('             8.64000E+03   8.33333E+04'));
% disp(sprintf('   5 NAME   "GroundModification"'));
% disp(sprintf('     YOUNG   %3.4E',propGroundmodYoung));
% disp(sprintf('     POISON  %3.4E',propGroundmodPoision));
% disp(sprintf('   6 NAME   "ShorWallGM_IF"'));
% disp(sprintf('     DSTIF   5.78704E+008  1.00000E+000'));
% disp(sprintf('   7 NAME   "SoilIF_Elastic"'));
% disp(sprintf('     DSTIF   6.00000E+001  1.00000E+000'));

end
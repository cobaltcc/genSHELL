function createMATERI()
% 

load inputDataFile.mat

disp(sprintf('''MATERI'''));
disp(sprintf('   1 NAME   "Concrete"'));
disp(sprintf('     YOUNG   %3.4E',propConcreteYoung));
disp(sprintf('     POISON  %3.4E',propConcretePoision));
%disp(sprintf('     DENSIT  %3.4E',propConcreteDensi));
disp(sprintf('   2 NAME   "SoilIF"'));
disp(sprintf('     DSTIF   8.00000E+001  1.00000E-000'));
disp(sprintf('     SIGDIS -4.00000E+004 -5.00000E+002  0.00000E+000  0.00000E+000')); 
disp(sprintf('             1.00000E+000  1.00000E+003'));
% disp(sprintf('   3 NAME   "VerticalJoint_IF"'));
% disp(sprintf('     DSTIF   1.00000E+003  1.00000E+003'));
% disp(sprintf('     SIGDIS -1.00000E+016 -1.00000E+003 -2.76000E+004 -1.20000E-001'));
% disp(sprintf('             0.00000E+000  0.00000E+000  4.55000E+004  1.00000E+003'));
% disp(sprintf('     TAUDIS -3.75000E+001 -1.00000E+006 -3.20000E+001 -2.70000E-001'));
% disp(sprintf('            -1.95000E+001 -1.00000E-001  0.00000E+000  0.00000E+000')); 
% disp(sprintf('             1.95000E+001  1.00000E-001  3.20000E+001  2.70000E-001')); 
% disp(sprintf('             3.75000E+001  1.00000E+006'));
disp(sprintf('   3 NAME   "JointIF"'));
disp(sprintf('     DSTIF   2.30000E+005  9.20000E+004'));
disp(sprintf('     SIGDIS -1.00000E+016 -1.00000E+003 -2.76000E+004 -1.20000E-001 '));
disp(sprintf('             0.00000E+000  0.00000E+000  4.55000E+004  1.00000E+003'));
disp(sprintf('     TAUDIS -1.50000E+002 -1.00000E+006 -1.28000E+002 -2.70000E-001'));
disp(sprintf('            -7.80000E+001 -1.00000E-001  0.00000E+000  0.00000E+000'));
disp(sprintf('             7.80000E+001  1.00000E-001  1.28000E+002  2.70000E-001'));
disp(sprintf('             1.50000E+002  1.00000E+006'));
% disp(sprintf('   5 NAME   "GroundModification"'));
% disp(sprintf('     YOUNG   %3.4E',propGroundmodYoung));
% disp(sprintf('     POISON  %3.4E',propGroundmodPoision));
% disp(sprintf('   6 NAME   "ShorWallGM_IF"'));
% disp(sprintf('     DSTIF   5.78704E+008  1.00000E+000'));
% disp(sprintf('   7 NAME   "SoilIF_Elastic"'));
% disp(sprintf('     DSTIF   6.00000E+001  1.00000E+000'));

end
function createMATERI2()
% 

load inputDataFile.mat

disp(sprintf('''MATERI'''));
disp(sprintf('   1 NAME   "Concrete"'));
disp(sprintf('     YOUNG   5.00000E+006'));
disp(sprintf('     POISON  2.00000E-001'));
disp(sprintf('   2 NAME   "SoilIF"'));
disp(sprintf('     DSTIF   8.00000E+001  1.00000E+000'));
disp(sprintf('     SIGDIS -4.00000E+004 -5.00000E+002  0.00000E+000  0.00000E+000'));
disp(sprintf('             1.00000E+000  1.00000E+003'));
disp(sprintf('   3 NAME   "JointIF"'));
disp(sprintf('     DSTIF   2.30000E+005  9.20000E+004'));
disp(sprintf('     SIGDIS -1.00000E+016 -1.00012E+003 -2.76000E+004 -1.20000E-001' ));
disp(sprintf('             0.00000E+000  0.00000E+000  4.55000E+004  1.00000E+003'));
disp(sprintf('     SIGDI2 -6.00000E+001 -1.00000E+006 -5.51000E+001 -5.00310E-001' ));
disp(sprintf('            -2.76000E+001 -3.10000E-004  0.00000E+000  0.00000E+000' ));
disp(sprintf('             2.76000E+001  3.10000E-004  5.51000E+001  5.00310E-001' ));
disp(sprintf('             6.00000E+001  1.00000E+006'));

end
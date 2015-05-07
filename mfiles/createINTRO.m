function createINTRO()

diary('../Output/main.dat')
diary on
disp(sprintf(':**************************************************'));
disp(sprintf(':ShorWall Shell generator Ver 0.01'));
disp(sprintf(':Author : Ali Soltani'));
disp(sprintf(':Cobalt Construction Company'));
disp(sprintf(':Generated %s',datestr(now())));
disp(sprintf(':**************************************************'));



load inputDataFile.mat
disp(sprintf(':input.xls imported'));
disp(sprintf(':'));
disp(sprintf(':------------------ IMPORTED VALUES ----------------'));
disp(sprintf(': Case Number %i ',caseNumber));
disp(sprintf(': Model Number: %i ',modelNumber));
disp(sprintf(': Shaft Radius: %2.1f ft',shaftRadius));
disp(sprintf(': Shaft Depth: %2.1f ft',shaftDepth));
disp(sprintf(': Segment Gap: %2.1f in',segmentGap));
disp(sprintf(': Segment Length: %2.1f',segmentLength));
disp(sprintf(': Segment Angle: %2.1f',segmentAngle));
disp(sprintf(': Buckling Factor: %2.1f',bucklingFactor));
disp(sprintf(': Pressure Profile Scale: %2.1f',pressureProfile));
disp(sprintf(':-------------- MATERIAL PROPERTIES ------------------'));
disp(sprintf(': Concrete Young: %2.1f',propConcreteYoung));
disp(sprintf(': Concrete Poision: %2.1f',propConcretePoision));
disp(sprintf(': Concrete Densit: %2.1f',propConcreteDensi));
disp(sprintf(': Ground Mod Young: %2.1f',propGroundmodYoung));
disp(sprintf(': Ground Mod Poision: %2.1f',propGroundmodPoision));
disp(sprintf(':-------------- CALCULATED VALUES ------------------'));
disp(sprintf(':'));
disp(sprintf(':'));
end

function createELEMENTS()

load 'ELEMENTS'

disp(sprintf('''ELEMENTS'''));
% disp(sprintf('SET  "Auto-Mesh(Face)"'));

FLAG_1=0;
FLAG_2=0;
FLAG_3=0;
for i=1:size(ELEMENTS,1)
    if ELEMENTS(i,2) == 2
        if FLAG_2 == 0
            disp(sprintf('MATERIAL 1'));
            disp(sprintf('GEOMETRY 1'));
            disp(sprintf('DATA 1'));
           disp(sprintf('SET "Soil_Spring"'));
           disp(sprintf('CONNECT'));
           FLAG_2 =1;
        end
        disp(sprintf('   %i Q24IF  %i %i %i %i %i %i %i %i', ...
            ELEMENTS(i,1),ELEMENTS(i,4),ELEMENTS(i,5) ...
            ));
    elseif ELEMENTS(i,2) == 1
         if FLAG_1 == 0
           disp(sprintf('SET "Panel"'));
           disp(sprintf('CONNECT'));
           FLAG_1 =1;
        end
        disp(sprintf('   %i Q20SF %i %i %i %i', ...
            ELEMENTS(i,1),ELEMENTS(i,4),ELEMENTS(i,5),  ...
            ELEMENTS(i,6),ELEMENTS(i,7)  ...
            ));
    elseif ELEMENTS(i,2) == 3
        if FLAG_3 == 0
           disp(sprintf('MATERIAL 2'));
           disp(sprintf('GEOMETRY 2'));
           disp(sprintf('DATA 1'));
           disp(sprintf('SET "Joints"'));
           disp(sprintf('CONNECT'));
           FLAG_3 =1;
        end
        disp(sprintf('   %i L16IF  %i %i %i %i',ELEMENTS(i,1),ELEMENTS(i,3),ELEMENTS(i,4),ELEMENTS(i,5),ELEMENTS(i,6)));
    elseif ELEMENTS(i,2) == 4
        disp(sprintf('   %i L16IF  %i %i %i %i',ELEMENTS(i,1),ELEMENTS(i,3),ELEMENTS(i,4),ELEMENTS(i,5),ELEMENTS(i,6)));
    end
end
%%%%%%%%%%%%%%%
disp(sprintf('MATERIAL 3'));
disp(sprintf('GEOMETRY 3'));
disp(sprintf('DATA 1'));

%%%%%%%%%%%%%%%
% disp(sprintf('MATERI'));
%%%%%%%%%%%%%%%
% [currentELEM] = searchELEM(1);
% disp(sprintf('/ %i-%i / 1',currentELEM(1),currentELEM(end)));
%%%%%%%%%%%%%%%
% [currentELEM] = searchELEM(2);
% disp(sprintf('/ %i-%i / 2',currentELEM(1),currentELEM(end)));
%%%%%%%%%%%%%%%
% [currentELEM] = searchELEM(3);
% disp(sprintf('/ %i-%i / 3',currentELEM(1),currentELEM(end)));
% %%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%
% [currentELEM] = searchELEM(4);
% disp(sprintf('/ %i-%i / 3',currentELEM(1),currentELEM(end)));



% disp(sprintf('DATA'));
% disp(sprintf('/ %i-%i / 1',1,size(ELEMENTS,1)));

%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%
% disp(sprintf('GEOMET'));
% [currentELEM] = searchELEM(1);
% disp(sprintf('/ %i-%i / 1',currentELEM(1),currentELEM(end)));
%%%%%%%%%%%%%%%
% [currentELEM] = searchELEM(2);
% disp(sprintf('/ %i-%i / 2',currentELEM(1),currentELEM(end)));
%%%%%%%%%%%%%%%
% [currentELEM] = searchELEM(3);
% disp(sprintf('/ %i-%i / 3',currentELEM(1),currentELEM(end)));
% %%%%%%%%%%%%%%%
% [currentELEM] = searchELEM(4);
% disp(sprintf('/ %i-%i / 3',currentELEM(1),currentELEM(end)));

end

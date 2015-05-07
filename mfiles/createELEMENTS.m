function createELEMENTS()

load 'ELEMENTS'

disp(sprintf('''ELEMENTS'''));
% disp(sprintf('SET  "Auto-Mesh(Face)"'));
disp(sprintf('CONNECT'));

for i=1:size(ELEMENTS,1)
    if ELEMENTS(i,2) == 2
        disp(sprintf('   %i CQ48I  %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i', ...
            ELEMENTS(i,1),ELEMENTS(i,4),ELEMENTS(i,5),ELEMENTS(i,6), ...
            ELEMENTS(i,7),ELEMENTS(i,8),ELEMENTS(i,9),ELEMENTS(i,10), ...
            ELEMENTS(i,11),ELEMENTS(i,12),ELEMENTS(i,13),ELEMENTS(i,14), ...
            ELEMENTS(i,15),ELEMENTS(i,16),ELEMENTS(i,17),ELEMENTS(i,18),ELEMENTS(i,19) ...
            ));
    elseif ELEMENTS(i,2) == 1
        disp(sprintf('   %i CQ40F  %i %i %i %i %i %i %i %i', ...
            ELEMENTS(i,1),ELEMENTS(i,4),ELEMENTS(i,5),ELEMENTS(i,6), ...
            ELEMENTS(i,7),ELEMENTS(i,8),ELEMENTS(i,9),ELEMENTS(i,10),ELEMENTS(i,11) ...
            ));
    elseif ELEMENTS(i,2) == 3
        disp(sprintf('   %i L16IF  %i %i %i %i',ELEMENTS(i,1),ELEMENTS(i,3),ELEMENTS(i,4),ELEMENTS(i,5),ELEMENTS(i,6)));
    elseif ELEMENTS(i,2) == 4
        disp(sprintf('   %i L16IF  %i %i %i %i',ELEMENTS(i,1),ELEMENTS(i,3),ELEMENTS(i,4),ELEMENTS(i,5),ELEMENTS(i,6)));
    end
end
%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%
disp(sprintf('MATERI'));
%%%%%%%%%%%%%%%
[currentELEM] = searchELEM(1);
disp(sprintf('/ %i-%i / 1',currentELEM(1),currentELEM(end)));
%%%%%%%%%%%%%%%
[currentELEM] = searchELEM(2);
disp(sprintf('/ %i-%i / 2',currentELEM(1),currentELEM(end)));
%%%%%%%%%%%%%%%
[currentELEM] = searchELEM(3);
disp(sprintf('/ %i-%i / 3',currentELEM(1),currentELEM(end)));
%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%
[currentELEM] = searchELEM(4);
disp(sprintf('/ %i-%i / 3',currentELEM(1),currentELEM(end)));



disp(sprintf('DATA'));
disp(sprintf('/ %i-%i / 1',1,size(ELEMENTS,1)));

%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%
disp(sprintf('GEOMET'));
[currentELEM] = searchELEM(1);
disp(sprintf('/ %i-%i / 1',currentELEM(1),currentELEM(end)));
%%%%%%%%%%%%%%%
[currentELEM] = searchELEM(2);
disp(sprintf('/ %i-%i / 2',currentELEM(1),currentELEM(end)));
%%%%%%%%%%%%%%%
[currentELEM] = searchELEM(3);
disp(sprintf('/ %i-%i / 3',currentELEM(1),currentELEM(end)));
%%%%%%%%%%%%%%%
[currentELEM] = searchELEM(4);
disp(sprintf('/ %i-%i / 3',currentELEM(1),currentELEM(end)));

end
function [X_OUT,Y_OUT,Z_OUT]=getElementXYZ(currentELEM)
load NODES
load ELEMENTS
X_OUT=[];
Y_OUT=[];
Z_OUT=[];
for i=1:size(currentELEM,1)
   X_OUT=[X_OUT;NODES(ELEMENTS(currentELEM(i),3),2)];
   Y_OUT=[Y_OUT;NODES(ELEMENTS(currentELEM(i),3),3)];
   Z_OUT=[Z_OUT;NODES(ELEMENTS(currentELEM(i),3),4)];
end

end
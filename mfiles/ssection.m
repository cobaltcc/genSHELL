clear
clc
load section.mat
X = XYZ(:,1);
Y = XYZ(:,2);
Z = -XYZ(:,3);

% %Generate the surface
% T=delaunay3(X,Y,Z);
% %Create and apply the colormap
% % c = zeros(64,3);
% % for i = 1:64
% %       c(i,1) = .5;%(i+32)/100;
% %       c(i,2) = 0;%i/100;
% %       c(i,3) = 0;%i/100;
% % end
% colormap default
% %Plot the surface
% hObj = trisurf(T,X,Y,Z,'FaceColor','interp','FaceLighting','phong');
% shading interp
%plot3(X,Y,Z,'*');
%axis equal
xlabel('XXX')
ylabel('YYY')
zlabel('ZZZ')
xlim([0 500])

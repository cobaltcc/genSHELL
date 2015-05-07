function NODES = genCylinderNodes(R,H,Nxy,Nz)
    [X,Y] = genCircleNode(R,Nxy);
    NODES = [];
    for i=linspace(0,H,Nz+1)
        NODES = [NODES; X',Y',i*ones(size(X,2),1)];
    end
    plot3(NODES(:,1),NODES(:,2),NODES(:,3),'*-')
    axis equal
end
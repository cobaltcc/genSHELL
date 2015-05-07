function VJ_XYZ=ELM_plotVJ(R,H,L,ringN,Gap,N,A_l,GAMMA,color_VJ)

VJ_XYZ=[];

for k = 1:ringN

     
 hold on
 axis equal

 if rem(k,2) ~= 0
     [X,Y]=genCircleNode(R,N,0);

     
 else
     [X,Y]=genCircleNode(R,N,A_l/2);

     
 end
 
 for i = 1:N
     CORNERS1=ELM_createCorners(R,L,H,GAMMA,[X(i),Y(i),(k-1)*(-H-Gap/12)]);
     
     if i == N
        CORNERS2=ELM_createCorners(R,L,H,GAMMA,[X(1),Y(1),(k-1)*(-H-Gap/12)]);
     else
        CORNERS2=ELM_createCorners(R,L,H,GAMMA,[X(i+1),Y(i+1),(k-1)*(-H-Gap/12)]);
     end
     
     TOP_R = CORNERS2(1,:);
     TOP_L = CORNERS1(2,:);
     BTM_L = CORNERS1(3,:);
     BTM_R = CORNERS2(4,:);
     
     NEW_CORNERS = [TOP_R;TOP_L;BTM_L;BTM_R];
     VJ_XYZ=[VJ_XYZ;NEW_CORNERS];
     fill3(NEW_CORNERS(:,1),NEW_CORNERS(:,2),NEW_CORNERS(:,3),color_VJ)
    
 end
end


L=0;
end

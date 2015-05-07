function [HJ_XYZ1,HJ_XYZ2]=ELM_plotHJ(R,H,L,ringN,Gap,N,A_l,GAMMA,color_HJ)
HJ_XYZ1=[];
HJ_XYZ2=[];
for k = 1:ringN-1
       
 hold on
 axis equal

 
 if rem(k,2) ~= 0
     [X1,Y1]=genCircleNode(R,N,0);
     [X2,Y2]=genCircleNode(R,N,A_l/2);
     
     
     for i = 1:N
        CORNERS1=ELM_createCorners(R,L,H,GAMMA,[X1(i),Y1(i),(k-1)*(-H-Gap/12)]);
     
     if i == 1
        CORNERS2=ELM_createCorners(R,L,H,GAMMA,[X2(N),Y2(N),(k)*(-H-Gap/12)]);
     else
        CORNERS2=ELM_createCorners(R,L,H,GAMMA,[X2(i-1),Y2(i-1),(k)*(-H-Gap/12)]); 
     end
     
        CORNERS3=ELM_createCorners(R,L,H,GAMMA,[X2(i),Y2(i),(k)*(-H-Gap/12)]);

     
    
     BTM_R1 = CORNERS1(4,:);
     BTM_L1 = CORNERS1(3,:);
     TOP_R2 = CORNERS2(1,:);
     TOP_L2 = CORNERS2(2,:);
     TOP_R3 = CORNERS3(1,:);
     TOP_L3 = CORNERS3(2,:);
     
     E1_TOP_R =  BTM_R1;
     E1_TOP_L = (BTM_R1+BTM_L1)/2;
     E1_BTM_L = TOP_L2;
     E1_BTM_R = (TOP_L2+TOP_R2)/2;
     E2_TOP_R = (BTM_R1+BTM_L1)/2;
     E2_TOP_L = BTM_L1;
     E2_BTM_L = (TOP_L3+TOP_R3)/2;
     E2_BTM_R = TOP_R3;
     
     E1_CORNERS = [E1_TOP_R;E1_TOP_L;E1_BTM_L;E1_BTM_R];
     E2_CORNERS = [E2_TOP_R;E2_TOP_L;E2_BTM_L;E2_BTM_R];
     HJ_XYZ1=[HJ_XYZ1;E1_CORNERS];
     HJ_XYZ2=[HJ_XYZ2;E2_CORNERS];
     
    fill3(E1_CORNERS(:,1),E1_CORNERS(:,2),E1_CORNERS(:,3),color_HJ)
    fill3(E2_CORNERS(:,1),E2_CORNERS(:,2),E2_CORNERS(:,3),color_HJ)
 end
     
     

     
 else
     [X1,Y1]=genCircleNode(R,N,A_l/2);
     [X2,Y2]=genCircleNode(R,N,0);
     
          for i = 1:N
     CORNERS1=ELM_createCorners(R,L,H,GAMMA,[X1(i),Y1(i),(k-1)*(-H-Gap/12)]);
     

        CORNERS2=ELM_createCorners(R,L,H,GAMMA,[X2(i),Y2(i),(k)*(-H-Gap/12)]);

     
     if i == N
        CORNERS3=ELM_createCorners(R,L,H,GAMMA,[X2(1),Y2(1),(k)*(-H-Gap/12)]);
     else
        CORNERS3=ELM_createCorners(R,L,H,GAMMA,[X2(i+1),Y2(i+1),(k)*(-H-Gap/12)]);
     end
     
    
     BTM_R1 = CORNERS1(4,:);
     BTM_L1 = CORNERS1(3,:);
     TOP_R2 = CORNERS2(1,:);
     TOP_L2 = CORNERS2(2,:);
     TOP_R3 = CORNERS3(1,:);
     TOP_L3 = CORNERS3(2,:);
     
     E1_TOP_R =  BTM_R1;
     E1_TOP_L = (BTM_R1+BTM_L1)/2;
     E1_BTM_L = TOP_L2;
     E1_BTM_R = (TOP_L2+TOP_R2)/2;
     E2_TOP_R = (BTM_R1+BTM_L1)/2;
     E2_TOP_L = BTM_L1;
     E2_BTM_L = (TOP_L3+TOP_R3)/2;
     E2_BTM_R = TOP_R3;
     
     E1_CORNERS = [E1_TOP_R;E1_TOP_L;E1_BTM_L;E1_BTM_R];
     E2_CORNERS = [E2_TOP_R;E2_TOP_L;E2_BTM_L;E2_BTM_R];
     HJ_XYZ1=[HJ_XYZ1;E1_CORNERS];
     HJ_XYZ2=[HJ_XYZ2;E2_CORNERS];
     
    fill3(E1_CORNERS(:,1),E1_CORNERS(:,2),E1_CORNERS(:,3),color_HJ)
    fill3(E2_CORNERS(:,1),E2_CORNERS(:,2),E2_CORNERS(:,3),color_HJ)
 end
     
 end
 

  end
end
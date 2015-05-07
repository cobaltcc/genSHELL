function [CORNERS]=createCorners(R,L_CURVED,H,GAMMA,CP,A_l)
    CX=CP(1);
    CY=CP(2);
    CZ=CP(3);
    

    L_DIFF = L_CURVED-2*sin(L_CURVED/2/R)*R;
    L =  L_CURVED + 2*L_DIFF;
    %gamma converting
    SMALL_L = tan(deg2rad(GAMMA))*H;
    
        
    DIR_X = [1 -1 -1 1];
   
    
    if (CY>0)
    
        DIR_X =  +DIR_X; 
    
    elseif (CY < 0)
        
        DIR_X =  -DIR_X;
        
    end
            
            
    
    
    m1 = CY/CX;
    
    if m1~=0
        m2 = -1/m1;

    
%Creating X,Y
    	TOP_Rx=CX+sqrt((((L+SMALL_L)/2)^2)/(1+m2^2))*DIR_X(1);
        TOP_Lx=CX+sqrt((((L-SMALL_L)/2)^2)/(1+m2^2))*DIR_X(2);
        BTM_Lx=CX+sqrt((((L+SMALL_L)/2)^2)/(1+m2^2))*DIR_X(3);
        BTM_Rx=CX+sqrt((((L-SMALL_L)/2)^2)/(1+m2^2))*DIR_X(4);
    
        TOP_Ry=m2*(TOP_Rx-CX)+CY;
        TOP_Ly=m2*(TOP_Lx-CX)+CY;
        BTM_Ly=m2*(BTM_Lx-CX)+CY;
        BTM_Ry=m2*(BTM_Rx-CX)+CY;

    else
%Creating X,Y
        TOP_Rx=CX;
        TOP_Lx=CX;
        BTM_Lx=CX;
        BTM_Rx=CX;
    
     if CX<0
        TOP_Ry=CY+(L+SMALL_L)/2;
        TOP_Ly=CY-(L-SMALL_L)/2;
        BTM_Ly=CY-(L+SMALL_L)/2;
        BTM_Ry=CY+(L-SMALL_L)/2;
    elseif CX>0
        TOP_Ry=CY-(L+SMALL_L)/2;
        TOP_Ly=CY+(L-SMALL_L)/2;
        BTM_Ly=CY+(L+SMALL_L)/2;
        BTM_Ry=CY-(L-SMALL_L)/2;
    end
        
    end
    
%Creating Z
    TOP_Rz=CZ+H/2;
    TOP_Lz=CZ+H/2;
    BTM_Lz=CZ-H/2;
    BTM_Rz=CZ-H/2;
    
   
%Creating XYX
    TOP_R=[TOP_Rx,TOP_Ry,TOP_Rz];
    TOP_L=[TOP_Lx,TOP_Ly,TOP_Lz];
    BTM_L=[BTM_Lx,BTM_Ly,BTM_Lz];
    BTM_R=[BTM_Rx,BTM_Ry,BTM_Rz];
    
    

    CORNERS = [TOP_R;TOP_L;BTM_L;BTM_R];
    
end
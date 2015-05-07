function [NODE,ELEMENT,TYPE]= ELM_createSpring(R,H,ringN,Gap,N,color_SPR)  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create Spring
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


N=100*2;
[X,Y]=genCircleNode(R,N,0);
NODE=[];
nodeNumber = (1:N);
TYPE='q4';
TOP_R=[];
TOP_L=[];
BTM_L=[];
BTM_R=[];

for k = 0:ringN
    Z = (k*(-H-Gap/12)+H/2+Gap/24)*ones(1,size(X,2));
    %NODE = [NODE; X' , Y' ,Z'];
    NODE = [NODE; (nodeNumber+N*k)', X' , Y' ,Z'];
end

for j = 1:ringN
    for i = 1:size(X,2)
        TOP_R=[TOP_R;i+(j-1)*size(X,2)];
    end
end

for j = 1:ringN
    for i = 1:size(X,2)-1
        TOP_L=[TOP_L;i+1+(j-1)*size(X,2)];
    end
    TOP_L=[TOP_L;1+(j-1)*size(X,2)];
end

for j = 1:ringN
    for i = 1:size(X,2)-1
        BTM_L=[BTM_L;i+size(X,2)+1+(j-1)*size(X,2)];
    end
    BTM_L=[BTM_L;size(X,2)+1+(j-1)*size(X,2)];
end

for j = 1:ringN
    for i = 1:size(X,2)
        BTM_R=[BTM_R;i+size(X,2)+(j-1)*size(X,2)];
    end
end


ELEMENT = [TOP_R, TOP_L, BTM_L, BTM_R]; 

     
 hold on
 axis equal
 
 for i = 1:size(ELEMENT,1)
     TOP_R= ELEMENT(i,1);
     TOP_L= ELEMENT(i,2);
     BTM_L= ELEMENT(i,3);
     BTM_R= ELEMENT(i,4);
     SPRING_CORNERS=[NODE(TOP_R,[2,3,4]);NODE(TOP_L,[2,3,4]) ;NODE(BTM_L,[2,3,4]) ;NODE(BTM_R,[2,3,4])];
     fill3(SPRING_CORNERS(:,1),SPRING_CORNERS(:,2),SPRING_CORNERS(:,3),color_SPR)
 end
 



% [L,N2,A_l,A_g]=getLNA(R+springR,0,L0);
% 
%  for k = 1:ringN

%  if rem(k,2) ~= 0
%      [X,Y]=genCircleNode(R+springR,N,0);
%  else
%      [X,Y]=genCircleNode(R+springR,N,A_l/2);
%  end
%  
%  plot3(X,Y,(k-1)*(-H-Gap/12)*ones(size(X,1),size(X,2)),'*k')
%  

%  end

  end

function [NODE,ELEMENT] = ELM_plotSegment(R,H,L,ringN,Gap,N,A_l,GAMMA,color_SEG)

NODE=[];
NODE_COUNTER=1:4;
ELEMENT=[];
ELEMENT_COUNTER=1;
ELEMENT_TYPE=1;
for k = 1:ringN
 
 hold on
 axis equal
 
 if rem(k,2) ~= 0
     [X,Y]=genCircleNode(R,N,0);
     %X_ROW=size(X,2);
     %Z=(k-1)*(-H-Gap/12)*ones(1,X_ROW);
     %NODE_SIZE=size(NODE,1);
     %I=[1:X_ROW]+NODE_SIZE;
     %NODE=[NODE;I', X', Y', Z'];
 else
     [X,Y]=genCircleNode(R,N,A_l/2);
 end
 
 plot3(X,Y,(k-1)*(-H-Gap/12)*ones(size(X,1),size(X,2)),'*k')
 
 for i = 1:N
     SEG_CORNERS=ELM_createCorners(R,L,H,GAMMA,[X(i),Y(i),(k-1)*(-H-Gap/12)]);
     I_N=NODE_COUNTER+size(NODE,1);
     NODE=[NODE;I_N', SEG_CORNERS];
     I_E=ELEMENT_COUNTER+size(ELEMENT,1);
     ELEMENT=[ELEMENT; I_E, ELEMENT_TYPE, I_N, zeros(1,4)];
     fill3(SEG_CORNERS(:,1),SEG_CORNERS(:,2),SEG_CORNERS(:,3),color_SEG)
 end
 
end
 
end
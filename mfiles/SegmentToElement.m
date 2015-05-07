function [N_OUT, E_OUT, T_OUT, B_OUT, S1_OUT, S2_OUT]=SegmentToElement(NODE,ELEMENT,R,ROW,COL)
N_OUT=[];
T_OUT=[];
B_OUT=[];
S1_OUT=[];
S2_OUT=[];
N_OUT_TEMP=[];
E_OUT=[];
LAST_NODE=0;
LAST_ELEM=0;
ELEM_SIZE=size(ELEMENT,1);
%figure
%hold on
for i=1:ELEM_SIZE
   NODE1=ELEMENT(i,3); 
   NODE2=ELEMENT(i,4);
   NODE3=ELEMENT(i,5);
   NODE4=ELEMENT(i,6);
   
   NODE1_XYZ=NODE(NODE1,[2 3 4]);
   NODE2_XYZ=NODE(NODE2,[2 3 4]);
   NODE3_XYZ=NODE(NODE3,[2 3 4]);
   NODE4_XYZ=NODE(NODE4,[2 3 4]);
   
%    plot3(NODE1_XYZ(1),NODE1_XYZ(2),NODE1_XYZ(3),'x')
%    plot3(NODE2_XYZ(1),NODE2_XYZ(2),NODE2_XYZ(3),'x')
%    plot3(NODE3_XYZ(1),NODE3_XYZ(2),NODE3_XYZ(3),'x')
%    plot3(NODE4_XYZ(1),NODE4_XYZ(2),NODE4_XYZ(3),'x')
   
   [EDGE1_X,EDGE1_Y,EDGE1_Z]=linspaceLinear(NODE1_XYZ,NODE4_XYZ,ROW);
   [EDGE2_X,EDGE2_Y,EDGE2_Z]=linspaceLinear(NODE2_XYZ,NODE3_XYZ,ROW);
   
%    plot3(EDGE1_X,EDGE1_Y,EDGE1_Z,'g')
%    plot3(EDGE2_X,EDGE2_Y,EDGE2_Z,'k')
    for j=1:size(EDGE1_X,1)
        [CIRC_X CIRC_Y CIRC_Z]=linspaceCircular([EDGE1_X(j),EDGE1_Y(j),EDGE1_Z(j)],...
            [EDGE2_X(j),EDGE2_Y(j),EDGE2_Z(j)],COL,0);
%         NODE_NUMBER=((((j-1)*(COL+1)+1):(COL+1)*j)*i)';
        NODE_RANGE=(((j-1)*(COL+1)+1):(COL+1)*j)';
        NODE_NUMBER=NODE_RANGE+LAST_NODE;
        LAST_NODE_TEMP=NODE_NUMBER(end);
        N_OUT_TEMP=[N_OUT_TEMP;NODE_NUMBER CIRC_X CIRC_Y CIRC_Z];
    end
      N_OUT=[N_OUT; N_OUT_TEMP];
      NN = N_OUT_TEMP(:,1);
      TOP = NN([1:COL+1]);
      BOT = NN([end-COL:end]);
      SIDE_1 = NN(find(mod(NN-1,COL+1) == 0));
      SIDE_2 = NN(find(mod(NN,COL+1) == 0));
      
      T_OUT = [ T_OUT; i TOP'];
      B_OUT = [B_OUT; i BOT'];
      S1_OUT = [S1_OUT; i SIDE_1'];
      S2_OUT = [S2_OUT; i SIDE_2'];
      
      N_OUT_TEMP=[];
      LAST_NODE=LAST_NODE_TEMP;
end

for i=1:ELEM_SIZE
   TEMP_ELEM=genElementsOfSegment(i,COL,ROW);
   LAST_ELEM=TEMP_ELEM(end,1);
   TEMP_ELEM(:,1)=TEMP_ELEM(:,1)+LAST_ELEM*(i-1);
   E_OUT=[E_OUT; TEMP_ELEM];
end


end


function [X_NEW, Y_NEW, Z_NEW]=linspaceCircular(XYZ1,XYZ2,M,LAST_FLAG)

    X1=XYZ1(:,1);
    Y1=XYZ1(:,2);
    Z1=XYZ1(:,3);

    X2=XYZ2(:,1);
    Y2=XYZ2(:,2);
    Z2=XYZ1(:,3);
    
    [T1,R1]=cart2pol(X1,Y1);
    [T2,R2]=cart2pol(X2,Y2);
    
%     if (T1<0 && T2>0)
%         Te=(-T1+T2)/M;
%     elseif (T2<0 && T1>0)
%         T2=T2+2*pi;
%         Te=-(T1-T2)/M;
%     else
%         Te=(T2-T1)/M;
%     end
    if abs(T2-T1)> pi
       T2=T2+2*pi;
    end

    Te=(T2-T1)/M;

    X_NEW=[];
    Y_NEW=[];
    Z_NEW=[];
    
    for i=1:(M+1)
        T_NEW=T1+Te*(i-1);
        [X,Y]=pol2cart(T_NEW,R1);
        X_NEW=[X_NEW; X];
        Y_NEW=[Y_NEW; Y];
        Z_NEW=[Z_NEW; Z1];
    end

    %plot3(X_NEW,Y_NEW,Z_NEW,'-*')
    L=0;
end


function [X_NEW, Y_NEW, Z_NEW]=linspaceLinear(XYZ1,XYZ2,N)

    X1=XYZ1(1);
    Y1=XYZ1(2);
    Z1=XYZ1(3);

    X2=XYZ2(1);
    Y2=XYZ2(2);
    Z2=XYZ2(3);

    Xe=(X1-X2)/N;
    Ye=(Y1-Y2)/N;
    Ze=(Z1-Z2)/N;

    X_NEW=[];
    Y_NEW=[];
    Z_NEW=[];
    
    for i=1:(N+1)
        X_NEW=[X_NEW; X2-Xe*(i-1)];
        Y_NEW=[Y_NEW; Y2-Ye*(i-1)];
        Z_NEW=[Z_NEW; Z2-Ze*(i-1)];
    end

end

function ELEM=genElementsOfSegment(SegmentNumber,COL,ROW)

STARTING_NODE=(SegmentNumber-1)*(COL+1)*(ROW+1)+1;
REFERENCE_NODES=genReferenceNodes(STARTING_NODE,COL,ROW);
ELEM=[];

for i=1:size(REFERENCE_NODES,2)
    N=REFERENCE_NODES(i);
    ELEM=[ELEM;i 1 1 COL+N+1 COL+N+2 N+1 N];  
end

end

function REF_NODES=genReferenceNodes(STARTING_NODE,COL,ROW)
REF_NODES=[];
for N=1:ROW
    START=(COL+1)*(N-1)+1;
    END=START+COL-1;
    REF_NODES=[REF_NODES, START:END];
end

REF_NODES=REF_NODES+STARTING_NODE-1;

end

function [N_OUT, E_OUT]=SegmentToElement(NODE,ELEMENT,R,ROW,COL)
N_OUT=[];
E_OUT=[];

ELEM_SIZE=size(ELEMENT,1);
for i=1:ELEM_SIZE
   NODE1=ELEMENT(i,3); 
   NODE2=ELEMENT(i,4);
   NODE3=ELEMENT(i,5);
   NODE4=ELEMENT(i,6);
   
   NODE1_XYZ=NODE(NODE1,[2 3 4]);
   NODE2_XYZ=NODE(NODE2,[2 3 4]);
   NODE3_XYZ=NODE(NODE3,[2 3 4]);
   NODE4_XYZ=NODE(NODE4,[2 3 4]);
   
   [EDGE1_X,EDGE1_Y,EDGE1_Z]=linspaceLinear(NODE1_XYZ,NODE4_XYZ,ROW);
   [EDGE2_X,EDGE2_Y,EDGE2_Z]=linspaceLinear(NODE2_XYZ,NODE3_XYZ,ROW);
   
    for j=1:size(EDGE1_X,1)
        [CIRC_X CIRC_Y CIRC_Z]=linspaceCircular([EDGE1_X(j),EDGE1_Y(j),EDGE1_Z(j)],...
            [EDGE2_X(j),EDGE2_Y(j),EDGE2_Z(j)],COL);
        NODE_NUMBER=(((i-1)*(COL+1)+1):(COL+1)*i)';
        N_OUT=[N_OUT;NODE_NUMBER CIRC_X CIRC_Y CIRC_Z];
    end
      
end

for i=1:ELEM_SIZE
   TEMP_ELEM=genElementsOfSegment(i,COL,ROW);
   E_OUT=[E_OUT; TEMP_ELEM];
end

L=0;

end


function [X_NEW, Y_NEW, Z_NEW]=linspaceCircular(XYZ1,XYZ2,M)

    X1=XYZ1(:,1);
    Y1=XYZ1(:,2);
    Z1=XYZ1(:,3);

    X2=XYZ2(:,1);
    Y2=XYZ2(:,2);
    Z2=XYZ1(:,3);
    
    [T1,R1]=cart2pol(X1,Y1);
    [T2,R2]=cart2pol(X2,Y2);

    Te=(T1-T2)/M;

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
    ELEM=[ELEM;i 1 1  N N+1 COL+N+1 COL+N+2];
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
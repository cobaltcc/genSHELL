function [N_OUT,E_OUT]=FourToEightConvertor2(NODE,ELEMENT)

N_OUT=NODE;
E_OUT=[];
NEXT_COUNTER=0;

INITIAL_NODE=NODE(1,1);
FINAL_NODE=NODE(end,1);

NEXT_NODE=FINAL_NODE+1;

% NEXT_NODE=NEXT_NODE+1;


for i=1:size(ELEMENT,1)
    n1=ELEMENT(i,1)-INITIAL_NODE+1;
    n3=ELEMENT(i,2)-INITIAL_NODE+1;
    n5=ELEMENT(i,3)-INITIAL_NODE+1;
    n7=ELEMENT(i,4)-INITIAL_NODE+1;
    
    [n2,NEXT_NODE,N_OUT]=addNodeBetween(n1,n3,NEXT_NODE,N_OUT);
    [n4,NEXT_NODE,N_OUT]=addNodeBetween(n3,n5,NEXT_NODE,N_OUT);
    [n6,NEXT_NODE,N_OUT]=addNodeBetween(n5,n7,NEXT_NODE,N_OUT);
    [n8,NEXT_NODE,N_OUT]=addNodeBetween(n7,n1,NEXT_NODE,N_OUT);

    E_OUT=[E_OUT; ELEMENT(i,1) n2 ELEMENT(i,2) n4 ELEMENT(i,3) n6 ELEMENT(i,4) n8];
    
end

    function [NODE_NUMBER, NEXT_NODE, N_OUT]=addNodeBetween(t1,t2,NEXT_NODE,N_OUT)
        NODE_NUMBER=NEXT_NODE;
        N_OUT=[N_OUT; NODE_NUMBER mid2(N_OUT(t1,:),N_OUT(t2,:))];
        NEXT_NODE=NEXT_NODE+1;
    end
    
    function MID=mid2(t1,t2)
        MID=(t1(2:end)+t2(2:end))/2;
    end


end
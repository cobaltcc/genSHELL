function [N_OUT,E_OUT]=FourToEightConvertor(NODE,ELEMENT)
N_OUT=[];
E_OUT=[];

NODE_SIZE=size(NODE,1);
for i=1:NODE_SIZE/4
    n1=NODE(i*4-3  , [2 3 4]);
    n2=NODE(i*4-2, [2 3 4]);
    n3=NODE(i*4-1, [2 3 4]);
    n4=NODE(i*4, [2 3 4]);
    mid1=mid(n1,n2);
    mid2=mid(n2,n3);
    mid3=mid(n3,n4);
    mid4=mid(n4,n1);
    
    N_OUT=[N_OUT;
        i*8-7   n1;
        i*8-6 mid1;
        i*8-5 n2;
        i*8-4 mid2;
        i*8-3 n3;
        i*8-2 mid3;
        i*8-1 n4;
        i*8 mid4];

    E_OUT=[E_OUT; i, 1, i*8-7, i*8-7, i*8-6, i*8-5, i*8-4, i*8-3, i*8-2, i*8-1, i*8];
end

    function MID=mid(t1,t2)
        MID=(t1+t2)/2;
    end

end
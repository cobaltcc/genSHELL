function ELEM_OUT = connectSides(SIDE2,SIDE1,ringN,startingElement)

segmentsInRing = size(SIDE1,1)/ringN;
ELEMENT3P = [];
ELEM_OUT = [];


for i=1:ringN
    
    TEMP_SIDE1 = SIDE1( [(1:segmentsInRing)+segmentsInRing*(i-1)],:);
    TEMP_SIDE2 = SIDE2( [(1:segmentsInRing)+segmentsInRing*(i-1)],:);
    TEMP_SIDE2 = [ TEMP_SIDE2(2:end,:); TEMP_SIDE2(1,:)];
    for j=1:segmentsInRing
        % move first row to bottom for SIDE2
               
        TEMP_OUT = connectH(TEMP_SIDE1(j,:), TEMP_SIDE2(j,:));
        ELEM_OUT = [ELEM_OUT; TEMP_OUT ]; 
    end
end
    
ELEM_NUMBERS = (1:size(ELEM_OUT,1))' + startingElement;
ELEM_TYPE = ones(size(ELEM_OUT,1),1)*3;
ELEM_OUT = [ELEM_NUMBERS ,ELEM_TYPE , ELEM_OUT];

end

function OUT=connectH(HEAD,TAIL)
    OUT=[];
    for i=2:(size(HEAD,2)-1)
            OUT=[OUT; HEAD(1,i) HEAD(1,i+1) TAIL(1,i) TAIL(1,i+1)];
    end

end
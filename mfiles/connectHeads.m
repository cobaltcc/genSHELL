function ELEM_OUT = connectHeads(TOP,BOT,ringN,lastElementNumber)
elementInEachRing = size(BOT,1)/ringN;

% find the middle node
midNodeIndex = floor(size(BOT,2)/2)+1;
ELEM_OUT=[];

% scan throgh all segments (X) and attach BOT to the top of the
% two elemenets at bottom (Y) (Z)
for i = 1:(ringN-1)
    for j = 1:elementInEachRing     
       [elemNumber_X, elemNumber_Y, elemNumber_Z] = elemNumber_XYZ(i,j,elementInEachRing);
       BOT_X = BOT(elemNumber_X,:);
       TOP_Y = TOP(elemNumber_Y,:);
       TOP_Z = TOP(elemNumber_Z,:);
       TEMP = join_XYZ(BOT_X,TOP_Y,TOP_Z,midNodeIndex);
       ELEM_OUT = [ELEM_OUT; TEMP ];
    end
end

rSIZE = size(ELEM_OUT,1);
elem_range = (1:rSIZE) + lastElementNumber;
elem_type = ones(1,rSIZE)*3;
ELEM_OUT=[elem_range', elem_type' , ELEM_OUT];

debug=0;

end

function [elemNumber_X, elemNumber_Y, elemNumber_Z] = elemNumber_XYZ(i,j,elementInEachRing)
        
        elemNumber_X = j+(i-1)*elementInEachRing;
        if rem(i,2) == 1
           %ODD RING NUMBER
           if j == 1
               elemNumber_Y = elemNumber_X + elementInEachRing;
               elemNumber_Z = elemNumber_Y + elementInEachRing -1;
           else
               elemNumber_Y = elemNumber_X + elementInEachRing;
               elemNumber_Z = elemNumber_X + elementInEachRing -1;
           end
        else
            %EVEN RING NUMBER
            if j == elementInEachRing
               elemNumber_Y = elemNumber_X + 1;
               elemNumber_Z = elemNumber_Y + elementInEachRing -1;
            else
               elemNumber_Y = elemNumber_X + elementInEachRing + 1;
               elemNumber_Z = elemNumber_X + elementInEachRing ;
            end
        end
end

function OUT = join_XYZ(BOT_X,TOP_Y,TOP_Z,midNodeIndex)
    OUT=[];
    BOT_X_L =BOT_X(2:midNodeIndex);
    BOT_X_R =BOT_X(midNodeIndex:end);
    TOP_Y_L =TOP_Y(2:midNodeIndex);
    %TOP_Y_R =TOP_Y(midNodeIndex:end);
    %TOP_Z_L =TOP_Z(2:midNodeIndex);
    TOP_Z_R =TOP_Z(midNodeIndex:end);
    OUT=[OUT; connect(BOT_X_R,TOP_Y_L)];
    OUT=[OUT; connect(BOT_X_L,TOP_Z_R)];
end

function OUT = connect(BOT,TOP)
    OUT=[];
    bSIZE = size(BOT,2);
    for i = 1:(bSIZE-1)
        OUT=[OUT; BOT(i) BOT(i+1) TOP(i) TOP(i+1)]; 
    end
end

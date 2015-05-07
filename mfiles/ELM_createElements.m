function [NODE,ELEMENT]= ELM_createElements(R,springToWall,L0,Gap,H,GAMMA,ringN,colors)

clf
axis equal
hold on


color_SEG = colors(1);
color_SPR = colors(2);
color_VJ = colors(3);
color_HJ = colors(4);


[L,N,A_l,A_g]=getLNA(R,Gap,L0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create Segments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[SEGMENT_NODE, SEGMENT_ELEM]=ELM_plotSegment(R,H,L,ringN,Gap,N,A_l,GAMMA,color_SEG);
%NODES1=[]; ELEMENTS1=[]; TYPES1=[];
[NODE1P,ELEMENT1P]=SegmentToElement(SEGMENT_NODE,SEGMENT_ELEM,R,4,10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create Spring using element Q24IF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[NODE2,ELEMENT2P]=translateNODE1(NODE1P,ELEMENT1P);
L=1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create Vertical Joint Interface
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TYPE_E3=3;
VJ_XYZ=ELM_plotVJ(R,H,L,ringN,Gap,N,A_l,GAMMA,color_VJ);
%NODES2=[]; ELEMENTS2=[]; TYPES2=[];
ELEMENT3_TEMP=[];
for i=1:size(VJ_XYZ,1)
   TEMP_NODEHOLDER=findNode(NODE1P, VJ_XYZ(i,:));
   ELEMENT3_TEMP = [ELEMENT3_TEMP; TEMP_NODEHOLDER];
end
ELEMENT3_TEMP=reshape(ELEMENT3_TEMP',4,[])';
ELEMENT3_TEMP=ELEMENT3_TEMP(:,[2 3 1 4]);
ELEMENT3_TEMP2=[];
for i=1:size(ELEMENT3_TEMP,1)
   A=ELEMENT3_TEMP(i,1);
   B=ELEMENT3_TEMP(i,3);
   ELEMENT3_TEMP2=[ELEMENT3_TEMP2; A A+1 B B+7; A+1 A+2 B+7 B+6]; 
end
I_E3= size(ELEMENT1P,1)+size(ELEMENT2P,1)+(1:size(ELEMENT3_TEMP2,1))';
TYPE_E3=3*ones(size(ELEMENT3_TEMP2,1),1);
ELEMENT3=[I_E3, TYPE_E3, ELEMENT3_TEMP2, zeros(size(I_E3,1),13)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create Hor Joint Interface
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[HJ_XYZ1,HJ_XYZ2]=ELM_plotHJ(R,H,L,ringN,Gap,N,A_l,GAMMA,color_HJ);
HJ_XYZ=[HJ_XYZ1;HJ_XYZ2];
ELEMENT4_TEMP=[];
for i=1:size(HJ_XYZ,1)
   TEMP_NODEHOLDER=findNode(NODE1P, HJ_XYZ(i,:));
   ELEMENT4_TEMP = [ELEMENT4_TEMP; TEMP_NODEHOLDER];
end
ELEMENT4_TEMP=reshape(ELEMENT4_TEMP',4,[])';
ELEMENT4_TEMP=ELEMENT4_TEMP(:,[1 2 4 3]);
I_E4= size(ELEMENT1P,1)+size(ELEMENT2P,1)+size(ELEMENT3,1)+(1:size(ELEMENT4_TEMP,1))';
TYPE_E4=4*ones(size(ELEMENT4_TEMP,1),1);
ELEMENT4=[I_E4, TYPE_E4, ELEMENT4_TEMP, zeros(size(I_E4,1),13)];

ELEMENT1P=[ELEMENT1P zeros(size(ELEMENT1P,1),8)];

%NODES3=[]; ELEMENTS3=[]; TYPES3=[];
 NODE=[NODE1P; NODE2];
 ELEMENT=[ELEMENT1P; ELEMENT2P; ELEMENT3; ELEMENT4];
 
end

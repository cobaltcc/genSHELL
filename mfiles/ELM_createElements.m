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
[NODE1, ELEMENT1]=ELM_plotSegment(R,H,L,ringN,Gap,N,A_l,GAMMA,color_SEG);
%NODES1=[]; ELEMENTS1=[]; TYPES1=[];
[NODE1P,ELEMENT1P]=FourToEightConvertor(NODE1,ELEMENT1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create Spring using element Q24IF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NODE2=[];

[X,Y]=genCircleNode(R,N,0);
[X_OUT,Y_OUT]=genCircleNode(R+springToWall,N,0);

nodeNumber = size(NODE1P,1)+(1:N);

TOP_R_OUT=[];
TOP_L_OUT=[];
BTM_L_OUT=[];
BTM_R_OUT=[];

%% INNER
% for k = 0:ringN
%     Z = (k*(-H-Gap/12)+H/2+Gap/24)*ones(1,size(X,2));
%     %NODE = [NODE; X' , Y' ,Z'];
%     NODE2 = [NODE2; (nodeNumber+N*k)', X' , Y' ,Z'];
% end
% 
% for j = 1:ringN
%     for i = 1:size(X,2)
%         TOP_R=[TOP_R;i+(j-1)*size(X,2)];
%     end
% end
% 
% for j = 1:ringN
%     for i = 1:size(X,2)-1
%         TOP_L=[TOP_L;i+1+(j-1)*size(X,2)];
%     end
%     TOP_L=[TOP_L;1+(j-1)*size(X,2)];
% end
% 
% for j = 1:ringN
%     for i = 1:size(X,2)-1
%         BTM_L=[BTM_L;i+size(X,2)+1+(j-1)*size(X,2)];
%     end
%     BTM_L=[BTM_L;size(X,2)+1+(j-1)*size(X,2)];
% end
% 
% for j = 1:ringN
%     for i = 1:size(X,2)
%         BTM_R=[BTM_R;i+size(X,2)+(j-1)*size(X,2)];
%     end
% end

%% OUTER

for k = 0:ringN
    Z = (k*(-H-Gap/12)+H/2+Gap/24)*ones(1,size(X,2));
    %NODE = [NODE; X' , Y' ,Z'];
    NODE2 = [NODE2; (nodeNumber+N*k)', X_OUT' , Y_OUT' ,Z'];
end

for j = 1:ringN
    for i = 1:size(X,2)
        TOP_R_OUT=[TOP_R_OUT;i+(j-1)*size(X_OUT,2)];
    end
end

for j = 1:ringN
    for i = 1:size(X_OUT,2)-1
        TOP_L_OUT=[TOP_L_OUT;i+1+(j-1)*size(X_OUT,2)];
    end
    TOP_L_OUT=[TOP_L_OUT;1+(j-1)*size(X_OUT,2)];
end

for j = 1:ringN
    for i = 1:size(X,2)-1
        BTM_L_OUT=[BTM_L_OUT;i+size(X_OUT,2)+1+(j-1)*size(X_OUT,2)];
    end
    BTM_L_OUT=[BTM_L_OUT;size(X_OUT,2)+1+(j-1)*size(X_OUT,2)];
end

for j = 1:ringN
    for i = 1:size(X,2)
        BTM_R_OUT=[BTM_R_OUT;i+size(X_OUT,2)+(j-1)*size(X_OUT,2)];
    end
end


%% ASSEMBLE Q24IF

[NODE2,ELEMENT2P]=translateNODE1(NODE1P,ELEMENT1P);


% ELEMENT1P_EXTRACT= ELEMENT1P(:, [3:end]);
% 
% ELEMENT2_TEMP = [TOP_R_OUT, TOP_L_OUT, BTM_L_OUT, BTM_R_OUT]+size(NODE1P,1);
% [NODE2,ELEMENT2P_TEMP]=FourToEightConvertor2(NODE2,ELEMENT2_TEMP);
% 
% 
% I_E2P= size(ELEMENT1P,1)+(1:size(ELEMENT2P_TEMP,1))';
% TYPE_E2P=2*ones(size(ELEMENT2P_TEMP,1),1);
% ELEMENT2P=[I_E2P, TYPE_E2P, ELEMENT1P_EXTRACT ELEMENT2P_TEMP];

% hold on
% axis equal
% 
% for i = 1:size(ELEMENT,1)
%     TOP_R= ELEMENT(i,1);
%     TOP_L= ELEMENT(i,2);
%     BTM_L= ELEMENT(i,3);
%     BTM_R= ELEMENT(i,4);
%     SPRING_CORNERS=[NODE(TOP_R,[2,3,4]);NODE(TOP_L,[2,3,4]) ;NODE(BTM_L,[2,3,4]) ;NODE(BTM_R,[2,3,4])];
%     fill3(SPRING_CORNERS(:,1),SPRING_CORNERS(:,2),SPRING_CORNERS(:,3),color_SPR)
% end
 



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

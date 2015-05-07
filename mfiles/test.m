clear
clc

color_SEG = 'b';
color_SPR = 'b';
color_VJ = 'y';
color_HJ = 'g';

colors= [color_SEG,color_SPR,color_VJ,color_HJ];

R=100;
springR = 10;
L0=20;
Gap=20/8;
H=5;
GAMMA=0;

ringN = 8;


ELM_createElements(R,springR,L0,Gap,H,GAMMA,ringN,colors)
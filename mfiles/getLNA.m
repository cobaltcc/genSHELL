function [ L, N, A_l, A_g ] = getLNA(R,G,L0)
% getLN() spits out recommended Inner segment length and Number of segments
% per Ring based on Shaft Radius and Gap and initial L.
% Gap is the packer thickness after segments are assembled.
G = G/12; %inch to feet
segmentLength = L0 + G; %ft
segmentIdealNumber = 2*R*pi / segmentLength;
segmentIntegerNumber = floor(segmentIdealNumber);

N = segmentIntegerNumber;
L = 2*R*pi/N-G;

A_l = rad2deg(L/R);
A_g = rad2deg(G/R);

end


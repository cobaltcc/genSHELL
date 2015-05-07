function [ segmentLength, segmentIntegerNumber, Angle_length, Angle_gap ] = getLNA(R,G,L0)
% getLN() spits out recommended Inner segment length and Number of segments
% per Ring based on Shaft Radius and Gap and initial L.
% Gap is the packer thickness after segments are assembled.

segmentLength = L0 + G; %ft
segmentIdealNumber = 2*R*pi / segmentLength;
segmentIntegerNumber = floor(segmentIdealNumber);

N = segmentIntegerNumber;
segmentLength = 2*R*pi/N-G;

Angle_length = rad2deg(segmentLength/R);
Angle_gap = rad2deg(G/R);

end


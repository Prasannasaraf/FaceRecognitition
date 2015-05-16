function [k1]=Glet(A)
%# Convert image to grey scale
img = rgb2gray(A);
%# Convert to double precision 
img = im2double(img); %# 
[m,n] = size(img);  %# Store the original size.
%R Height
%C Width
%u No of scales
%V No of orientation
%# It is best if the filter size is odd, so it has a discrete center.
R = 127; 
C = 127;
Kmax = pi/2;
frequency = sqrt( 2 );
Delta = 2 * pi;
DeltaSquare = Delta * Delta;

%# The minimum amount of padding is just "one side" of the filter.
%# Add 1 if the image size is odd.
%# This assumes the filter size is odd.

pR = (R-1)/2;
pC = (C-1)/2;
if rem(m,2) ~= 0; pR = pR + 1; end;
if rem(n,2) ~= 0; pC = pC + 1; end;
img = padarray(img,[pR pC],'pre'); %# Pad image to handle circular convolution.

GW = {}; 
%# First, construct the filter bank.
for v = 0 : 4
    for u = 1 : 8
        %# create a gabor wavelet
        GW =  [GW {GaborWavelet(R, C, Kmax, frequency, u, v, DeltaSquare)}];
    end
end

%# Pad all the filters to size of padded image.
%# We made sure padsize will only be even, so we can divide by 2.
padsize = size(img) - [R C];
GW = cellfun( ...
        @(x) padarray(x,padsize/2), ...
        GW, ...
        'UniformOutput',false);

imgFFT = fft2(img);                         %# Pre-calculate image FFT.

for i=1:length(GW)
    filter = fft2( ifftshift( GW{i} ) );    %# See Numerical Recipes.
    imgfilt{i} = ifft2( imgFFT .* filter ); %# Apply Convolution Theorem.
end

%# Sum the responses to each filter. Do it in the above loop to save some space.
imgS = zeros(m,n);
for i=1:length(imgfilt)
    imgS = imgS + imgfilt{i}(pR+1:end,pC+1:end); %# Just use the valid part.
end

C2=max(max(imgS));
k1=imgS./C2;

%figure,colormap(gray);imagesc(abs(gw1));
%end
%figure,colormap(gray);imagesc(abs(k1));
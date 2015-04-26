function example()
clear all
clc
close all
% load train database
load('prsn.mat','T','TrainDatabasePath');

%load The test image
[InputImage , fileCanceled]= imgetfile;
if fileCanceled 
    disp('No file selected');
else
    
% load the trained database
[m, A, Eigenfaces] = EigenfaceCore(T);

OutputName = Recognition(InputImage, m, A, Eigenfaces);

SelectedImagePath = strcat(TrainDatabasePath,'\Train',OutputName);
SelectedImage = imread(SelectedImagePath);

imshow(InputImage);
title('Test Image');
figure(2),imshow(SelectedImage);
title('Equivalent Image');

str = strcat('Matched image is :  ',OutputName);
disp(str)
end
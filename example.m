clear all
clc
close all

% load train datanase
load('prsn.mat','T','TrainDatabasePath');

%load The test image
[InputImage , fileCanceled]= imgetfile;
if fileCanceled 
    exit; 
end

% load the trained database
[m, A, Eigenfaces] = EigenfaceCore(T);

OutputName = Recognition(InputImage, m, A, Eigenfaces);

SelectedImagePath = strcat(TrainDatabasePath,'\Train',OutputName);
SelectedImage = imread(SelectedImagePath);

imshow(InputImage);
title('Test Image');
figure(23),imshow(SelectedImage);
title('Equivalent Image');

str = strcat('Matched image is :  ',OutputName);
disp(str)
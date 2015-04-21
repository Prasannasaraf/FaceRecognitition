
clear all
clc
close all

% You can customize and fix initial directory paths
TrainDatabasePath = uigetdir('F:\FYP\FR\FR\train1', 'Select training database path' );
TestDatabasePath = uigetdir('F:\FYP\FR\FR\test1', 'Select test database path');

prompt = {'Enter test image name (a number between 1 to 10):'};
dlg_title = 'Input of Color Local Texture Feature Based Face Recognition System';
num_lines= 1;
def = {'1'};

testImagePath = inputdlg(prompt,dlg_title,num_lines,def);
testImagePath = strcat(TestDatabasePath,'\Test',char(testImagePath),'.jpg');

im = imread(testImagePath);
T = CreateDatabase(TrainDatabasePath);
[m, A, Eigenfaces] = EigenfaceCore(T);

OutputName = Recognition(testImagePath, m, A, Eigenfaces);

SelectedImagePath = strcat(TrainDatabasePath,'\Train',OutputName);
SelectedImage = imread(SelectedImage);

imshow(im)
title('Test Image');
figure(23),imshow(SelectedImage);
title('Equivalent Image');

str = strcat('Matched image is :  ',OutputName);
disp(str)

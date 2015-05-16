function T = CreateDatabase(TrainDatabasePath)
% Align a set of face images (the training set T1, T2, ... , TM )
% Description: This function reshapes all 2D images of the training database
% into 1D column vectors. Then, it puts these 1D column vectors in a row to 
% construct 2D matrix 'T'.
TrainFiles = dir(TrainDatabasePath);
Train_Number = 0;
for i = 1:size(TrainFiles,1)
    if not(strcmp(TrainFiles(i).name,'.')|strcmp(TrainFiles(i).name,'..')|strcmp(TrainFiles(i).name,'Thumbs.db'))
        Train_Number = Train_Number + 1; % Number of all images in the training database
    end
end
%%%%%%%%%%%%%%%%%%%%%%%% Construction of 2D matrix from 1D image vectors
T = [];
for i = 1 : Train_Number
    str = int2str(i);
    str = strcat('\train',str,'.jpg');
    str = strcat(TrainDatabasePath,str);
    img = imread(str);
    img = imresize(img,[64 64]);
    [irow icol] = size(img);
    A=img;
    k1=Glet(A);
    k11=abs(k1);
    %figure,colormap(gray);imagesc(k11);
    Input_Im=img;
    R=1;
    LBP_Im = LBP(Input_Im, R);
    c1=k11(:);
    c2=LBP_Im(:);
    temp= vertcat(c1,c2);
   T = [T temp]; % 'T' grows after each turn                    
end
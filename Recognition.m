function OutputName = Recognition(InputImage, m, A, Eigenfaces)

ProjectedImages = [];
Train_Number = size(Eigenfaces,2);
for i = 1 : Train_Number
    temp = Eigenfaces'*A(:,i); % Projection of centered images into facespace
    ProjectedImages = [ProjectedImages temp]; 
end

%%%%%%%%%%%%%%%%%%%%%%%% Extracting the PCA features from test image
%InputImage = rgb2gray(InputImage);
temp = imread(InputImage);
img = imresize(temp,[64 64]);
%[irow icol] = size(temp);
A = img;
k1=Glet(A);
k11=abs(k1);
Input_Im = img;
R=1;
LBP_Im = LBP(Input_Im, R);
c1=k11(:);
c2=LBP_Im(:);
InImage = vertcat(c1,c2);


Difference = double(InImage)-m; % Centered test image
ProjectedTestImage = Eigenfaces'*Difference; % Test image feature vector

%%%%%%%%%%%%%%%%%%%%%%%% Calculating Euclidean distances 

Euc_dist = [];
for i = 1 : Train_Number
    q = ProjectedImages(:,i);
    temp = ( norm( ProjectedTestImage - q ) )^2;
    Euc_dist = [Euc_dist temp];
end

[Euc_dist_min , Recognized_index] = min(Euc_dist);

OutputName = strcat(int2str(Recognized_index),'.jpg');
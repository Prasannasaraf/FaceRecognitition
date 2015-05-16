function [m, A, Eigenfaces] = EigenfaceCore(T)
% Use Principle Component Analysis (PCA) to determine the most 
% discriminating features between images of faces.
%%%%%%%%%%%%%%%%%%%%%%%%% Calculating the mean image 
m = mean(T,2); 
Train_Number = size(T,2);

%%%%%%%%%%%%%%%%%%%%%%%% Calculating the deviation of each image from mean image
%Diff Array
A = [];  
for i = 1 : Train_Number
    temp = double(T(:,i)) - m; 
    A = [A temp];
end

%%%%%%%%%%%%%%%%%%%%%%%% Snapshot method of Eigenface methos
% Covariance
L = A'*A; 
[V D] = eig(L); 

%%%%%%%%%%%%%%%%%%%%%%%% Sorting and eliminating eigenvalues


L_eig_vec = [];
for i = 1 : size(V,2) 
    if( D(i,i)>1 )
        L_eig_vec = [L_eig_vec V(:,i)];
    end
end

%%%%%%%%%%%%%%%%%%%%%%%% Calculating the eigenvectors of covariance matrix 'C'

Eigenfaces = A * L_eig_vec; % A: centered image vectors
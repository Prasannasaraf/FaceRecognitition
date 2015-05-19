function Recognize(handles)
% load train database
try
    load('prsn.mat','T','TrainDatabasePath');
    %load The test image
    InputImage = handles.inputimage ;

    % load the trained database
    [m, A, Eigenfaces] = EigenfaceCore(T);

    OutputName = Recognition(InputImage, m, A, Eigenfaces);

    SelectedImagePath = strcat(TrainDatabasePath,'\Train',OutputName);
    SelectedImage = imread(SelectedImagePath);

    imshow(SelectedImage, 'Parent', handles.axes2);
    histogram(SelectedImage,handles.axes8,handles.axes9);
    str = strcat('Matched image is :  ',OutputName);
    disp(str)
catch ME
    disp(getReport(ME));
end
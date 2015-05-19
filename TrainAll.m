%function T = waste()
root =  uigetdir('F:\Work\Trail', 'Select training database path' );
list = dir(root);
index = [list.isdir];
files = {list(index).name};  %Gets list of directories ->faces94,95,96
count = size(files,2); % Returns no of columns 5
T = [];
disp('count :');
disp(count);
for i = 3 : count
    disp(count-i);
    name   = char(files(i));
    path1  = sprintf('%s\\%s',root,name);
    list1  = dir(path1);
    files1 = {list1.name};
    count1 = size(files1,2);
    for j = 3 :count1
        name1   = char(files1(j));
        path2  = sprintf('%s\\%s',path1,name1);
        img = imread(path2);
        img = imresize(img,[64 64]);
        [irow, icol] = size(img);
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
        % 'T' grows after each turn
        T = [T temp];
    end
end   
filename = 'prsnsarf.mat';
save(filename,'T');
disp('Success');
    
% You can customize and fix initial directory paths
function TrainDataBase(hObjects,handles)
TrainDatabasePath = uigetdir('F:\FYP\FR\FR\train1', 'Select training database path' );
if (TrainDatabasePath ~= 0)
    T = CreateDatabase(TrainDatabasePath);
    filename = 'prsn.mat';
    save(filename,'T','TrainDatabasePath');
    handles.flag = 1 ;
    guidata(hObjects,handles);
end
% You can customize and fix initial directory paths
function TrainDataBase(hObject,handles)
set(handles.TrainDatabase,'BackgroundColor',[1 1 0]);
TrainDatabasePath = uigetdir('C:\Users\prasa_000\Documents\GitHub\Images\train1', 'Select training database path' );
if (TrainDatabasePath ~= 0)
    T = CreateDatabase(TrainDatabasePath);
    filename = 'prsn.mat';
    save(filename,'T','TrainDatabasePath');
    handles.flag = 1 ;
    guidata(hObject,handles);
end
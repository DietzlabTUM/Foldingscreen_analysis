%% execute this to select a folder and analyze a folding screen
close all, clear all, clc
root_path = '/Users/jonasfunke/Dropbox (DIETZ LAB)/FOLDINGSCREENS'; % change this to your directory

[path_selected] = uigetdir(root_path, 'Select an Directory with intial foling screen');
[~,dir_name,ext] = fileparts(path_selected);

if ~isempty(ext)
    dir_name = [dir_name ext];
end

txt_files = dir([path_selected filesep '*.txt']);
tif_files = dir([path_selected filesep '*.tif']);

if length(tif_files)==1 && length(txt_files)==1
    compute_profiles(root_path, dir_name, txt_files(1).name, tif_files(1).name);
else
    disp(['Error. Found ' num2str(length(tif_files)) ' tif files and ' num2str(length(txt_files)) ' txt files in ' dir_name])
end

disp('Done.')
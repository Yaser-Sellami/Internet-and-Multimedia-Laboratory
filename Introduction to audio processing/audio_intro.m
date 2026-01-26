%% Loading an audio file

load handel.mat
filename_1 = "handel.wav";
audiowrite(filename, y, Fs)

load stereo_sample.mat
filename_2 = "stereo_sample.mat";
audiowrite(filename, y, Fs)
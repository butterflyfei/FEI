clear;
load('E:\experiment\experiment data\allsuspsth\ccrowba1.mat');
load('E:\experiment\experiment data\allsuspsth\allsusba1.mat')
load('E:\experiment\experiment data\cf\44cf.mat');
fc1(1,:)=allcf;
fc1(2,:)=ccrow;
fc2=sortrows(fc1');
fc3=fc2';
fw1(1,:)=allcf;
fw1(2:202,:)=allw;
fw2=sortrows(fw1');
fw3=fw2';
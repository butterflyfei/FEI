clc;
clear;
load('E:\experiment\experiment data\allpsth\allcc\allcc(unrank).mat');
allcc_ba=c(1:4,:);
allcc_ma=c(5:8,:);
allcc_yi=c(9:13,:);
load('E:\experiment\experiment data\allpsth\allcc\begain at 0 end at 1000\allba_cc.mat');
all_cc_ba=all_cc;
load('E:\experiment\experiment data\allpsth\allcc\begain at 0 end at 1000\allma_cc.mat');
all_cc_ma=all_cc;
load('E:\experiment\experiment data\allpsth\allcc\begain at 0 end at 1000\allyi_cc.mat');
all_cc_yi=all_cc;
allcc_ba_gain=abs(all_cc_ba)-abs(allcc_ba);
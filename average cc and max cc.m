clear;
r='wu';                             %%    cc   第一行为1,2,3,4声平均PSTH与包络的相关系数；
ccr=strcat('cc',r);                        %%  第二行为所有神经元中最大相关系数
load('ccmaxwu1.mat');
load('crmaxwu1.mat')
c(1,1)=ccmax(1,2);
c(2,1)=crmax;
load('ccmaxwu2.mat');
load('crmaxwu2.mat')
c(1,2)=ccmax(1,2);
c(2,2)=crmax;
load('ccmaxwu3.mat');
load('crmaxwu3.mat')
c(1,3)=ccmax(1,2);
c(2,3)=crmax;
load('ccmaxwu4.mat');
load('crmaxwu4.mat')
c(1,4)=ccmax(1,2);
c(2,4)=crmax;
cc=roundn(c,-2);
save(ccr,'cc');
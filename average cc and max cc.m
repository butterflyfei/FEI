clear;
r='wu';                             %%    cc   ��һ��Ϊ1,2,3,4��ƽ��PSTH���������ϵ����
ccr=strcat('cc',r);                        %%  �ڶ���Ϊ������Ԫ��������ϵ��
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
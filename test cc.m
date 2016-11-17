clc;
clear;
load('E:\experiment\experiment data\20160108-1result\psth55c6u1ba1.mat');
a1=z1;
a1=a1';
load('E:\experiment\experiment data\20150918result1\psth35ba1.mat')
a2=z1;
a3=a2;
a2=a2';

r='ba1';
load('E:\experiment\experiment data\waveform and envelop\allenvelop.mat');
load('E:\experiment\experiment data\waveform and envelop\allenvelopfile.mat');
id=ismember(name,r);
td=[100,120,140,120,100,120,140,100,100,140,180,100,100,140,160,100,100,120,160,100];
[xid yid]=find(id==1);
enve1=envelop(yid,:);
bd=20;
d=td(1,yid);
cc2=corrcoef(enve1(1,bd:d),a1(bd:d,1));
cc3=corrcoef(enve1(1,bd:d),a2(bd:d,1));
cc1=corrcoef(a1(bd:d,1),a3(1,bd:d));
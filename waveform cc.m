%%
clear;
load('E:\experiment\experiment data\20151230-1\datafile009');
channel=6;
unit=1;
spi(1,:)=double(NEV.Data.Spikes.Electrode(1,:)); %%提取电极通道

spi(2,:)=double(NEV.Data.Spikes.TimeStamp(1,:)); %%提取spike对应采样点
spi(3,:)=double(NEV.Data.Spikes.Unit(1,:)); %%提取神经元分类信息
spi(2,:)=spi(2,:)/30;           %% 计算对应时间点
wave=double(NEV.Data.Spikes.Waveform(:,:));

[x0 y0]=find(spi(1,:)==channel);
spi1=spi(:,y0);
wave1=wave(:,y0);

[x y]=find(spi1(3,:)==unit);
spi2=spi1(:,y);   %对应unit的所有spike时刻点
wave2=wave1(:,y);

w2=wave2*0.25;  %%matlab打开cerebus数据之间的换算，场电位及spike都乘以0.25 
nc=size(w2);
w3=sum(w2,2)/nc(1,2);    %求spike均值模板
for i=1:nc(1,2)
   cr=corrcoef(w2(:,i),w3);    %求每个spike与模板的相关系数
   cc(1,i)=cr(1,2); 
end
[x1 y1]=find(cc<0.6 | cc==0.6);     %选择相关系数>0.9的spike
w4=w2(:,y1);
x=[1:1:48];
x=x/30;
%figure;  
subplot(1,2,1); plot(x,w4,'k');
subplot(1,2,2); plot(x,w2,'k');
xlabel('Time (ms)');ylabel('Voltage(uV)');
% title([r1spike,'组数据']);
% saveas(gcf,r1spike,'fig');
% save(r1spike,'w4');
%%

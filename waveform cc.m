%%
clear;
load('E:\experiment\experiment data\20151230-1\datafile009');
channel=6;
unit=1;
spi(1,:)=double(NEV.Data.Spikes.Electrode(1,:)); %%��ȡ�缫ͨ��

spi(2,:)=double(NEV.Data.Spikes.TimeStamp(1,:)); %%��ȡspike��Ӧ������
spi(3,:)=double(NEV.Data.Spikes.Unit(1,:)); %%��ȡ��Ԫ������Ϣ
spi(2,:)=spi(2,:)/30;           %% �����Ӧʱ���
wave=double(NEV.Data.Spikes.Waveform(:,:));

[x0 y0]=find(spi(1,:)==channel);
spi1=spi(:,y0);
wave1=wave(:,y0);

[x y]=find(spi1(3,:)==unit);
spi2=spi1(:,y);   %��Ӧunit������spikeʱ�̵�
wave2=wave1(:,y);

w2=wave2*0.25;  %%matlab��cerebus����֮��Ļ��㣬����λ��spike������0.25 
nc=size(w2);
w3=sum(w2,2)/nc(1,2);    %��spike��ֵģ��
for i=1:nc(1,2)
   cr=corrcoef(w2(:,i),w3);    %��ÿ��spike��ģ������ϵ��
   cc(1,i)=cr(1,2); 
end
[x1 y1]=find(cc<0.6 | cc==0.6);     %ѡ�����ϵ��>0.9��spike
w4=w2(:,y1);
x=[1:1:48];
x=x/30;
%figure;  
subplot(1,2,1); plot(x,w4,'k');
subplot(1,2,2); plot(x,w2,'k');
xlabel('Time (ms)');ylabel('Voltage(uV)');
% title([r1spike,'������']);
% saveas(gcf,r1spike,'fig');
% save(r1spike,'w4');
%%

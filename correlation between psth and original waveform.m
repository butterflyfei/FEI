 clc;
 clear; 
 r='yi_10ms';              %%%change the name 
 file='correlation_psth_original_envelop_';
 filer=[file,r]; 
 load('E:\experiment\experiment data\allraster\allraster1(1-92)\allpsth_yi.mat');   %%%change name
 allpsth=all_psths;
 load('E:\experiment\experiment data\waveform and envelop\envelop_hilbert\yi_envelop.mat');
 tbin=10;
 nbin=100;
 %%
 n=2;                %%%% n=1,为ma, n=2,为yi
 if tbin==10
 td(1,:)=[50,70,90,50];   %%%%ma
 td(2,:)=[50,70,80,50];   %%% yi
 end
 
 if tbin==5    
 td(1,:)=[100,140,180,100];   %%%%ma
 td(2,:)=[100,140,160,100];    
 end
%% 10ms sliding window average
 for t=1:4
    singletone_psth=allpsth{1,t};
    singletone_envelop=yi_envelop{1,t};
    for j=1:92
         singletone_psth_1=reshape(singletone_psth(1:1000,j),tbin,nbin);
         singletone_psth_10(:,j)=mean(singletone_psth_1); 
         singletone_psth_10(:,j)=mapminmax(singletone_psth_10(:,j));   %%%%归一化
    end
      allpsth_10{1,t}=singletone_psth_10;
    
        singletone_envelop_1=reshape(singletone_envelop(1:16000,1),tbin*16,nbin);
        singletone_envelop_10(:,1)=mean(singletone_envelop_1);
        singletone_envelop_10(:,1)=mapminmax(singletone_envelop_10(:,1));   %%%归一化
    
      all_envelop_10{1,t}=singletone_envelop_10;
 end
 
 %% calculate correlation coefficient
 for t=1:4
    singletone_psth_10=allpsth_10{1,t};
    singletone_envelop_10=all_envelop_10{1,t};
    for i=1:92
    cc1=corrcoef(singletone_psth_10(1:td(n,t),i),singletone_envelop_10(1:td(n,t),1));
    cc(1,i)=cc1(1,2);
    end      
    allcc{1,t}=cc;
 end

 save(filer,'allcc');
 
 %%
 clc;
 clear;
 load('E:\experiment\experiment data\cf\allcf.mat');
 
 load('correlation_psth_original_envelop_ma_5ms.mat');
 tone=1;
 allcc_1=allcc(1,tone);
 allcc_11=cell2mat(allcc_1);
 load('ma1cc.mat');
 allcc_2=allcc;
 H=ttest(allcc_11,allcc_2);
 plot(allcf,allcc_11,'ko');  hold on;
 plot(allcf,allcc_2,'ro');  hold off;
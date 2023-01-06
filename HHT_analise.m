% Limpeza de variáveis
clc,close all,clear all;

%% Classe dos sinais
Class_1 = readmatrix('Class01_50db.xlsx'); % Sinal puro
Class_2 = readmatrix('Class02_50db.xlsx'); % Afundamento
Class_3 = readmatrix('Class03_50db.xlsx');
Class_4 = readmatrix('Class04_50db.xlsx');
Class_5 = readmatrix('Class05_50db.xlsx');
Class_6 = readmatrix('Class06_50db.xlsx');
Class_7 = readmatrix('Class07_50db.xlsx');
Class_8 = readmatrix('Class08_50db.xlsx');
Class_9 = readmatrix('Class09_50db.xlsx');

%% Frequencia de amostragem e sinal no tempo
% Ts = 1/15360;
% fs=15360;
% Tempo=0:Ts:((2560-1)*Ts);
% Tempo= Tempo.*100;
% plot(Tempo,Class_1(55,1:2560),'LineWidth',1)
% grid on
% title('Sinal de tensão')
% xlabel('Tempo (ms)')
% ylabel('Tensão (V em pu)')

%% Visualizações

% % subplot(3,3,1)
% % plot(Tempo,Class_1(55,1:2560))
% % title('Sinal puro')
% % xlabel('Tempo (ms)')
% % ylabel('Tensão (V em pu)')
% % subplot(3,3,2)
% % plot(Tempo,Class_2(55,1:2560))
% % title('Afundamento')
% % xlabel('Tempo (ms)')
% % ylabel('Tensão (V em pu)')
% % subplot(3,3,3)
% % plot(Tempo,Class_3(98,1:2560))
% % title(' Elevação')
% % xlabel('Tempo (ms)')
% % ylabel('Tensão (V em pu)')
% % subplot(3,3,4)
% % plot(Tempo,Class_4(93,1:2560))
% % title('Interrupção')
% % xlabel('Tempo (ms)')
% % ylabel('Tensão (V em pu)')
% % subplot(3,3,5)
% % plot(Tempo,Class_5(93,1:2560))
% % title('Transiente impulsivo')
% % xlabel('Tempo (ms)')
% % ylabel('Tensão (V em pu)')
% % subplot(3,3,6)
% % plot(Tempo,Class_6(99,1:2560))
% % title('Transiente Oscilatório')
% % xlabel('Tempo (ms)')
% % ylabel('Tensão (V em pu)')
% % subplot(3,3,7)
% % plot(Tempo,Class_7(95,1:2560))
% % title('Harmonicos')
% % xlabel('Tempo (ms)')
% % ylabel('Tensão (V em pu)')
% % subplot(3,3,8)
% % plot(Tempo,Class_8(96,1:2560))
% % title('Flicker')
% % xlabel('Tempo (ms)')
% % ylabel('Tensão (V em pu)')
% % subplot(3,3,9)
% % plot(Tempo,Class_9(97,1:2560))
% % title('Notching')
% % xlabel('Tempo (ms)')
% % ylabel('Tensão (V em pu)')
Y = [Class_1;Class_2;Class_3;Class_4;Class_5; Class_6;Class_7;Class_8;Class_9];
 
Ts=1/15360;
fs=15360;
Tempo=0:Ts:((2560-1)*Ts);
addpath 'C:\Users\Maisa\Documents\MATLAB\Examples\R2020a\wavelet\PracticalIntroductionToMultiresolutionAnalysisExample'
y1=zeros(900,20);
y_t=zeros(900,20);

[imf_vmd, ~, info_vmd] = vmd (Y(355,:));
helperMRAPlot (Y(355,:), imf_vmd, Tempo, 'vmd' , 'VMD' );
%% Extracao de caracteristicas
% for i = 1:900
%     %Decomposicao 
%     [imf_vmd, ~, info_vmd] = vmd (Y(i,:),'NumIMF',8);
%     
%     %helperMRAPlot (Y(1,:), imf_vmd, Tempo, 'vmd' , 'VMD' );   
%     % helperMRAPlot (Y(555,:), imf_vmd, Tempo, 'vmd' , 'VMD' );
%     
%     % Frequencia Central     
%     y_t(i,1)= info_vmd.CentralFrequencies(8)*1000;
%     y_t(i,2)=info_vmd.CentralFrequencies(7)*1000;
%     y_t(i,3)= info_vmd.CentralFrequencies(6)*1000;    
%     y_t(i,4)= info_vmd.CentralFrequencies(5)*1000;
%     
%     % Taxa de Cruzamento por zeros
%     y_t(i,5) = sum(abs(diff(imf_vmd(:,6)>0)))/length(imf_vmd(:,6));
%     y_t(i,6) = sum(abs(diff(imf_vmd(:,7)>0)))/length(imf_vmd(:,7));
%     y_t(i,7) = sum(abs(diff(imf_vmd(:,8)>0)))/length(imf_vmd(:,8));
%     y_t(i,8) = sum(abs(diff(imf_vmd(:,5)>0)))/length(imf_vmd(:,5));
%     
%     % Energia
%     y_t(i,9)= sum(imf_vmd(:,8).^2);
%     y_t(i,10)= sum(imf_vmd(:,7).^2);
%     y_t(i,11)= sum(imf_vmd(:,6).^2);
%     y_t(i,12)= sum(imf_vmd(:,5).^2);
%     
%     %variancia
%     y_t(i,13)=var(imf_vmd(:,8));
%     y_t(i,14)=var(imf_vmd(:,5));
%     y_t(i,15)=var(imf_vmd(:,6));
%     y_t(i,16)=var(imf_vmd(:,7));
%     
%        % magnitude
%         y_t(i,17)= sqrt(sum(imf_vmd(:,8).*imf_vmd(:,8)));
%         y_t(i,18)= sqrt(sum(imf_vmd(:,7).*imf_vmd(:,7)));
%          y_t(i,20)= sqrt(sum(imf_vmd(:,5).*imf_vmd(:,5)));
% end
% 
% o=[ ones(100,1); 2*ones(100,1);3*ones(100,1);4*ones(100,1);5*ones(100,1);6*ones(100,1);7*ones(100,1);8*ones(100,1);9*ones(100,1)];
% y2 = [y_t o];
% csvwrite('11caracteristicavmd_teste.csv',y2);
% figure(2)
% %hht(imf_vmd,fs,'FrequencyLimits',[0,300]);
% % 
% % for i = 1:900
% % [imf_vmd, ~, info_vmd] = vmd (Y(i,:),'NumIMF',8); 
% % % helperMRAPlot (Y(230,:), imf_vmd, Tempo, 'vmd' , 'VMD' );
% % % figure(2)
% % 
% % % Calculo da HHT - IMF 7
% % [hs, f, t, imfinsf, imfinse]= hht(imf_vmd(:,6),fs,'FrequencyLimits',[0,300]);
% % 
% % % Frequencia instantanea energia da IMF 7
% % y1(i,1)= mean(imfinsf);
% % y1(i,2)= mean(imfinse*100);
% % 
% % % Calculo da HHT - IMF 6
% % [hs, f, t, imfinsf, imfinse]= hht(imf_vmd(:,7),fs,'FrequencyLimits',[0,300]);
% % 
% % % Frequencia instantanea energia da IMF 7
% % y1(i,3)= mean(imfinsf);
% % y1(i,4)= mean(imfinse*100);
% % 
% % media_e = mean(imfinse.*100);
% % media_f = mean(imfinsf);
% % dei1=zeros(2560,1);
% % dfi1=zeros(2560,1);
% % apt=zeros(2560,1);
% % apf=zeros(2560,1);
% 
% for j=1:1:length(imfinse)
%  apt(j,1) = j * imfinse(j,1).*100;
%  apf(j,1) = imfinsf(j,1) * imfinse(j,1);
%  dei1(j,1) = (imfinse(j,1).*100- media_e)^2;
%  dfi1(j,1) = (imfinsf(j,1)- media_f)^2;
% end
% 
% y1(i,5) = sum(dei1)/2560;
% y1(i,6) = sum(dfi1)/2560;
% y1(i,7) = sum(apt)/2560;
% y1(i,8)= sum(apf)/2560;
% media_e=0;
% media_f=0;
% 
%  
% [hs, f, t, imfinsf, imfinse]= hht(imf_vmd(:,8),fs,'FrequencyLimits',[0,300]);
% y1(i,9)= mean(imfinsf);
% y1(i,10)= mean(imfinse.*100);
% 
% media_e1 = mean(imfinse.*100);
% media_f1 = mean(imfinsf);
% dei11=zeros(2560,1);
% dfi11=zeros(2560,1);
% apt1=zeros(2560,1);
% apf1=zeros(2560,1);
%  
%  for j=1:1:length(imfinse)
%     apt1(j,1) = j * imfinse(j,1).*100;
%     apf1(j,1) = imfinsf(j,1) * imfinse(j,1);
%     dei11(j,1) = (imfinse(j,1).*100 - media_e1)^2;
%     dfi11(j,1) = (imfinsf(j,1)- media_f1)^2;
%  end
%  y1(i,11) = sum(dei11)/2560;
%  y1(i,12) = sum(dfi11)/2560;
%  y1(i,13) = sum(apt1)/2560;
%  y1(i,14)= sum(apf1)/2560;
%  media_e1=0;
%  media_f1=0;
%  y1(i,15)= sum(abs(diff(imf_vmd(:,5)>0)))/length(imf_vmd(:,5));
% 
% end
% o=[ ones(100,1); 2*ones(100,1);3*ones(100,1);4*ones(100,1);5*ones(100,1);6*ones(100,1);7*ones(100,1);8*ones(100,1);9*ones(100,1)];
% y2 = [y1 o];
% csvwrite('todos_teste_xx12.csv',y2);
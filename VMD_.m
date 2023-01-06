clc,close all,clear all;
Class_1 = csvread('Class01.csv');
Class_2 = csvread('Class02.csv');
Class_3 = csvread('Class03.csv');
Class_4 = csvread('Class04.csv');
Class_5 = csvread('Class05.csv');
Class_6 = csvread('Class06.csv');
Class_7 = csvread('Class07.csv');
Class_8 = csvread('Class08.csv');
Class_9 = csvread('Class09.csv');

 Ts=1/15360;
fs=15360;
Tempo=0:Ts:((2500-1)*Ts);
Tempo= Tempo.*100;
plot(Tempo,Class_1(55,1:2500),'LineWidth',1)
grid on
title('Sinal de tensão')
xlabel('Tempo (ms)')
ylabel('Tensão (V em pu)')


% subplot(3,3,1)
% plot(Tempo,Class_1(55,1:2500))
% title('Sinal puro')
% xlabel('Tempo (ms)')
% ylabel('Tensão (V em pu)')
% subplot(3,3,2)
% plot(Tempo,Class_2(55,1:2500))
% title('Afundamento')
% xlabel('Tempo (ms)')
% ylabel('Tensão (V em pu)')
% subplot(3,3,3)
% plot(Tempo,Class_3(98,1:2500))
% title(' Elevação')
% xlabel('Tempo (ms)')
% ylabel('Tensão (V em pu)')
% subplot(3,3,4)
% plot(Tempo,Class_4(93,1:2500))
% title('Interrupção')
% xlabel('Tempo (ms)')
% ylabel('Tensão (V em pu)')
% subplot(3,3,5)
% plot(Tempo,Class_5(93,1:2500))
% title('Transiente impulsivo')
% xlabel('Tempo (ms)')
% ylabel('Tensão (V em pu)')
% subplot(3,3,6)
% plot(Tempo,Class_6(99,1:2500))
% title('Transiente Oscilatório')
% xlabel('Tempo (ms)')
% ylabel('Tensão (V em pu)')
% subplot(3,3,7)
% plot(Tempo,Class_7(95,1:2500))
% title('Harmonicos')
% xlabel('Tempo (ms)')
% ylabel('Tensão (V em pu)')
% subplot(3,3,8)
% plot(Tempo,Class_8(96,1:2500))
% title('Flicker')
% xlabel('Tempo (ms)')
% ylabel('Tensão (V em pu)')
% subplot(3,3,9)
% plot(Tempo,Class_9(97,1:2500))
% title('Notching')
% xlabel('Tempo (ms)')
% ylabel('Tensão (V em pu)')
 Y = [Class_1;Class_2;Class_3;Class_4;Class_5; Class_6;Class_7;Class_8;Class_9];
% 
Ts=1/16000;
fs=16000;
Tempo=0:Ts:((2500-1)*Ts);
addpath 'C:\Users\Maisa\Documents\MATLAB\Examples\R2020a\wavelet\PracticalIntroductionToMultiresolutionAnalysisExample'
y1=zeros(900,15);

[imf_vmd, ~, info_vmd] = vmd (Y(355,:));
helperMRAPlot (Y(355,:), imf_vmd, Tempo, 'vmd' , 'VMD' );
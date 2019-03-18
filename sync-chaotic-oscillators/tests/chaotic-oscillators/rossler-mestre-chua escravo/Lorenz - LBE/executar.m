%Este � Segundo passo a ser executado 
%O primeiro passo � escolher a equivalencia matem�tica a ser utilizada
%no arquivo rossler.m
clear all; close all; clc;

% Defini��o dos parametros do modelo
a = 1/5;
b = 1/5;
c = 5.7;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xd1=load('xlordriver.dat');
% x1l=x1l(1:end-1);
k=0.5;
y0=[0; 0; 0]; % Condi��es iniciais (localiza��es iniciais)
dt =0.05;    %passo de integra��o
int=[0:dt:900]; %intervalo da simula��o
Y(:,1)=y0; %Criando vetor de dados da Saida
yin = y0; 
for i=1:length(int) %loop que executa o rk4
    tempo = i*dt;
    ysaida = rk4(@(t,y)rossler(t,y,a,b,c,k,xd1,i),dt,tempo,yin);
    Y = [Y ysaida];
    yin = ysaida;
    
end
%plot3(Y(1,:),Y(2,:),Y(3,:),'r') %plota a saida em um gr�fico 3d
%salvando uma das vari�veis (xponto nesse caso)

plot(Y(2,:));
xlord=Y(2,:);
%xlord=xlord./35;
save('xroslork5.dat','xlord','-ascii') 
figure()
plot(xlord,'b')
hold on
plot(xd1,'k')
legend('Rossler','Chua');
title('Sincronismo para k = 1000');
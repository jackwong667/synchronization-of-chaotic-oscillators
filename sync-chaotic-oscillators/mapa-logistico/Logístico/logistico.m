clc; clear all; close all;

format long;

r = 4;
T = 100; 
x(1) = 0.95;

%------------------------ 1� MAPA LOG�STICO -------------------------------

for it=1:T-1

x(it+1)=r*x(it)*(1-x(it));

end

% EXTENS�O DO 1� MAPA LOG�STICO

x_ext(1)=0.95;

for it=1:T-1
    
x_ext(it+1)=r*x_ext(it)*(1)-r*x_ext(it)*x_ext(it);

end

tempo=(1:T)-1;

%axis([-1 200 0 1])

figure(1)
plot(tempo,x,'*-')
xlabel('Tempo (anos)')
ylabel('Popula��o')
title('Mapa log�stico para r = 4 (sincronizado)')
hold on

% LBE 1� MAPA LOG�STICO E EXTENS�O

N = length(x);

for k = 1:N
    a(k)= log10((abs(x(k)-x_ext(k)))/2);
end

figure(3)
plot(a)
title('LBE 1� MAPA LOG�STICO E EXTENS�O')
xlabel('Iterations')
ylabel('log_{10}(\epsilon_{\alpha,n})')

hold on

% LBE 1 MAPA LOG�STICO VPA


N = length(x);

x_vpa=vpa(x,10000);
x_ext_vpa=vpa(x_ext,10000);

for k = 1:N
    a(k)= log10((abs(x_vpa(k)-x_ext_vpa(k)))/2);
end

%figure(5)
plot(a,'o k')
title('LBE 1� MAPA LOG�STICO E EXTENS�O - VPA')
xlabel('Iterations')
ylabel('log_{10}(\epsilon_{\alpha,n})')
legend('Double','VPA')


%------------------- 2� MAPA LOG�STICO ------------------------------------

x = single(x);

x2(1)=0.9;

x2 = single(x2);


for it=1:T-1

x2(it+1)=r*x2(it)*(1-x(it));

end

figure(1)
plot(tempo,x2,'o- r')
legend('x = 0.95', 'x = 0.9')



% RETRATO DE FASE

figure(2)
plot(x,x2)
title('Retrato de fase mapa log�stico (sincronizado)')


% EXTENS�O DO 2� MAPA LOG�STICO

x2_ext(1)=0.95;

for it=1:T-1
    
x2_ext(it+1)=r*x2_ext(it)*(1)-r*x2_ext(it)*x(it);

end


% LBE DO 2� MAPA LOG�STICO

N = length(x);

for k = 1:N
    a(k)= log10((abs(x2(k)-x2_ext(k)))/2);
end

figure(4)
plot(a)
title('LBE 2� MAPA LOG�STICO E EXTENS�O - SINGLE')
xlabel('Iterations')
ylabel('log_{10}(\epsilon_{\alpha,n})')

axis([0 100 -16 0])

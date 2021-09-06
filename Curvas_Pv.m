clc
clear all

% -----------------------------------------------------------------
% DATOS INICIALES
% -----------------------------------------------------------------
Vn=500*10^3;
Sn=1400*10^6;
fp1=0.95;
fp2=0.9;
fp3=0.85;
fp4=0.8;
R=2.2176;
Xr=28.3384;
Qreac=60*10^6;
Qc1=-300*10^6;
Qc2=-100*10^6;
Qr1=+50*10^6;
Qr2=150*10^6;

A=zeros(1000,5);
B=zeros(1000,5);

% --------------------------------------------------
% [1] Variables y Grafica "Curva PV a diferentes fdp"
% --------------------------------------------------
for i=1:1000
    A(i,1)=(Vn*(1-(i-50)*10^-3));
    A(i,2)=((-((A(i,1))^2)+Vn*A(i,1)-Qreac*Xr)/(Xr*tan(acos(fp1))+R))/(10^6);
    A(i,3)=((-((A(i,1))^2)+Vn*A(i,1)-Qreac*Xr)/(Xr*tan(acos(fp2))+R))/(10^6);
    A(i,4)=((-((A(i,1))^2)+Vn*A(i,1)-Qreac*Xr)/(Xr*tan(acos(fp3))+R))/(10^6);
    A(i,5)=((-((A(i,1))^2)+Vn*A(i,1)-Qreac*Xr)/(Xr*tan(acos(fp4))+R))/(10^6);
    A(i,6)=0.95;
   
end

for i=1:1000
    A(i,1)= A(i,1)/Vn;
end

figure

x=A(:,2);
y=A(:,1);
plot(x,y);

hold on
x2=A(:,3);
x3=A(:,4);
x4=A(:,5);
x5=A(:,6);
y=A(:,1);

plot(x2,y);
plot(x3,y);
plot(x4,y);
plot(x2,x5);
legend('fdp=0.95','fdp=0.9','fdp=0.85)','fdp=0.8')
hold off
xlim([0 5000])
xticks([0:200:5000])
ylim([0.4 1.1])
yticks([0.4:0.05:1.1])
title('Curva PV a diferentes fdp')
xlabel('Potencia Activa (MW)') 
ylabel('V (pu)')
grid on


% --------------------------------------------------
% [2] Variables y Grafica "Curva PV con compensación"
% --------------------------------------------------
for i=1:1000
    B(i,1)=(Vn*(1-(i-50)*10^-3));
    B(i,2)=((-((B(i,1))^2)+Vn*B(i,1)-Qreac*Xr)/(Xr*tan(acos(fp2))+R))/(10^6);
    B(i,3)=((-((B(i,1))^2)+Vn*B(i,1)-Qc1*Xr-Qreac*Xr)/(Xr*tan(acos(fp2))+R))/(10^6);
    B(i,4)=((-((B(i,1))^2)+Vn*B(i,1)-Qc2*Xr-Qreac*Xr)/(Xr*tan(acos(fp2))+R))/(10^6);
    B(i,5)=((-((B(i,1))^2)+Vn*B(i,1)-Qr1*Xr-Qreac*Xr)/(Xr*tan(acos(fp2))+R))/(10^6);
    B(i,6)=((-((B(i,1))^2)+Vn*B(i,1)-Qr2*Xr-Qreac*Xr)/(Xr*tan(acos(fp2))+R))/(10^6);
    B(i,7)=0.95;
    B(i,8)=638.21;
    B(i,9)=1171.47;
    
    B(i,10)=cos(atan((Qreac*10^(-6)+B(i,2)*tan(acos(fp2)))/B(i,2)));
    B(i,11)=cos(atan(((Qc1+Qreac)*10^(-6)+B(i,3)*tan(acos(fp2)))/B(i,3)));
    B(i,12)=cos(atan(((Qr2+Qreac)*10^(-6)+B(i,6)*tan(acos(fp2)))/B(i,6)));
    
    B(i,13)=(((B(i,2)*10^6)^2+(B(i,2)*tan(acos(B(i,10)))*10^6)^2)/(B(i,1))^2)/(10^6);
    B(i,14)=(B(i,2)/((B(i,2))+B(i,13)))*100;
    B(i,15)=(((B(i,3)*10^6)^2+(B(i,3)*tan(acos(B(i,11)))*10^6)^2)/(B(i,1))^2)/(10^6);
    B(i,16)=(B(i,3)/((B(i,3))+B(i,15)))*100;
    B(i,17)=(((B(i,6)*10^6)^2+(B(i,6)*tan(acos(B(i,12)))*10^6)^2)/(B(i,1))^2)/(10^6);
    B(i,18)=(B(i,6)/((B(i,6))+B(i,17)))*100;
    B(i,19)=99.44;
end

for i=1:1000
    B(i,1)= B(i,1)/Vn;
end

figure 
x=B(:,2);
y=B(:,1);
plot(x,y);
title('Curva PV con compensación')
xlabel('Potencia Activa (MW)') 
ylabel('V2 (pu)')
hold on
x2=B(:,3);
x3=B(:,4);
x4=B(:,5);
x5=B(:,6);
x6=B(:,7);
x7=B(:,8);
x8=B(:,9);
y=B(:,1);

plot(x2,y);
plot(x3,y);
plot(x4,y);
plot(x5,y);
plot(x2,x6);
plot(x7,y);
plot(x8,y);

legend('Qc=0','Qc=300MVAR','Qc=100MVAR','Qind=50MVAR','Qind=150MVAR')
grid minor

xlim([0 5000])
xticks([0:200:5000])
ylim([0.4 1.1])
yticks([0.4:0.05:1.1])
hold off


% --------------------------------------------------
% [3] Variables y Grafica "Curva PV eficiencia
% --------------------------------------------------
figure

x=B(:,3);
y=B(:,14);
plot(x,y);
hold on
y1=B(:,16);
y2=B(:,18);
plot(x,y1);
plot(x,y2);
plot(x8,y);
plot(x,B(:,19))
hold off

title('Eficiencia')
xlabel('Pot Act') 
ylabel('Eficiencia %')
legend('Qc=0','Qc=300MVAR','Qind=150MVAR')
xlim([0 5000])
xticks([0:200:5000])
ylim([90 100])
yticks([90:1:100])
grid minor


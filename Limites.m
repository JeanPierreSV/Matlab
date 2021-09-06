% Calcular los siguientes limites
clc
clear all

syms x m 
%Primer ejemplo
fprintf('--- PRIMER EJERCICIO : NIVEL INTERMEDIO ---\n\n')
fprintf('***Primero: Hallar el limite x-->0 \n')
f1 = (((x^3+8)^(1/3))-((x^2+4)^0.5))/(x^2);
pretty(f1)
Respuesta1 = limit(f1,x,0)
fprintf('\n\n')

%Segundo ejemplo
fprintf('***Segundo: Hallar el limite x--> -2 \n')
f2 = (((3*x+5)^(1/3))+x+3)/(((x+1)^(1/3))+1);
pretty(f2)
Respuesta2 = limit(f2,x,-2)
fprintf('\n\n')

%Tercer ejemplo
fprintf('***Tercero: Hallar el valor de m \n')
f3 = (x^2-m*x+3*x-3*m)/(x-m);
pretty(f3)
Resp3 = limit(f3,x,m);
[m] = solve(Resp3==m^2-27)
fprintf('\n\n')

%Cuarto ejemplo
fprintf('***Cuarto: Verifique si la funcion es continua y grafiquela \n')
%Verificar la continuidad en el punto 1
fun1=x^2+3; fun2=x+1;
fprintf('fun1=x^2+3 si x=<1 \n')
fprintf('fun2=x+1 si x>1 \n\n')
limitfun1=limit(fun1,x,1,'left')
limitfun2=limit(fun2,x,1,'right')

if limitfun1==limitfun2
    disp('La funcion es continua')
else
    disp('La funcion no es continua')
end

%Grafica
x1 = linspace(0,1,100);
fun1=x1.^2+3;
plot(x1,fun1,'r','linewidth',2)
hold

x2 = linspace(1.001,2,100);
fun2=x2+1;
plot(x2,fun2,'b','linewidth',2)

xlabel('Eje X'), ylabel('Eje Y')
title('Grafica de f(x)')
legend('fun1=x^2+3','fun2=x+1')
grid
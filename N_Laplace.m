clear all;clc
fprintf('   TRANSFORMADAS DE LAPLACE \n')
syms a n s t
x0 = laplace(1,t,s)
x1 = laplace(exp(a*t),t,s)
x2 = laplace(t^5,t,s)
x3 = laplace(sin(a*t),t,s)
fprintf('Presiona enter para continuar')
pause;

 
% ----------------
% Operaciones
% ----------------
clear all;clc
a = [1 2 0 0 4]
b = [1 1 1]
producto = conv(a,b)
[q,r] = deconv(a,b)
polyval(a,0) % Evaluamos el polinomia a con cero
raices = roots(a)     % las raices del polinomia a 
%poly(2 2)
% Determina un polinomi a partir de sus raices 


% -4*s + 8     -12    8
% -------- =   --- + ---
% s^2+6s+8     s+4   s+2
a0 = [-4 8];
b0 = [1 6 8];
[r p k] = residue(a0,b0)



fprintf('Presiona enter para continuar')
pause;


% -------------------------
% Ecuaciones diferenciales
% -------------------------
% d(i1)/dt + 50*i2 = 60
% 0.005d(i2)/dt + (i2-i1) = 0

% Ecuaciones algebraicas pos Trasf.Laplace
%    s*I1(s) + 50*I2(s)     = 60/s
% -200*I1(s) +(s+200)*I2(s) = 0
clear all;clc
s = sym('s');
A = [s 50;-200 s+200];
b = [60/s; 0];
I = A\b;
pretty(I)

I1 = I(1);
I2 = I(2);
i1 = ilaplace(I1);
i2 = ilaplace(I2);
a0 = simplify(i1)
a1 = simplify(i2)
fprintf('Presiona enter para continuar')
pause;



% -------------------------
% Transformadas de Laplace
% -------------------------
clear all;clc
% R(s) +( )  [     s+1   ]   Y(s)
%   ?   -    ------------    ?
%        ?   [(s+6)(s-2)s ] 
%
H1 = tf([1 1],[1 6]);
H2 = tf(1,[1 -2]);
H3 = tf(1,[1 0]);
G = series(series(H1,H2),H3)
Y = feedback(G,1)

N = [1 -2 3 4]; D=[1 -5 7 3];
H = tf(N,D)
polos = roots(D)
ceros = roots(N)
figure(1)
bode(H)

figure(2)
pzmap(H)  %Mapa que muestra los polos y ceros
Z1 = zpk(H)    %Determina los polos y ceros en una F.T
Z2 = zpk(ceros,polos,5)
fprintf('Presiona enter para continuar')
pause;

% -------------------------
% Diagrama de raices
% -------------------------
% R(s) +( )  [   k(s+2)  ]   Y(s)
%   ?   -    ------------    ?
%        ?   [ s^2+4s+13 ] 
clear all;clc
N = [1 2];
D = [1 4 13];
H = tf(N,D)
figure(1)
rlocus(H)

figure(2)
k = 0:0.5:60;
for j=1:12
    N0 = [k 2*k];
    D0 =[1 4+k 13+2*k];
    H0 = tf(N0,D0);
    pzmap(H0);
    pause
end    

fprintf('Presiona enter para continuar')
pause;

% -------------------------
% Ecuaciones de estado
% -------------------------
clear all;clc
A = [0 1 0;0 0 1; 11 -5 -1];
B = [0; 0; -3];
C = [7 1 0];
D = -2;
sistema = ss(A,B,C,D)
pzmap(sistema)
% Para ver la estabilidad del sistema dinamico expresado en forma de
% ecuacion de estado, es importante los autovalores y autovectores de la
% matriz A. El sistema es estrictamente estable si la parte real de todo
% sus autovalores son menores a cero
[autovec, autoval] = eig(A)
fprintf('Presiona enter para continuar')
pause;


% -----------------------------------
% Respuesta temporal usando Laplace
% RAICES REALES Y DIFERENTES
% -----------------------------------
clc; clear all;
Num=[1 -2];
RaMul=conv([1 1],conv([1 1],[1 1])); %Creo la raiz multipla
Den=conv(RaMul,[1 4]);
G=tf(Num,Den);
%Respuesta del sistema usando la ecuación temporal
t=0:0.05:15;
y=-1-(1/9).*exp(-4.*t)+(10/9).*exp(-1.*t)+(2/3).*t.*exp(-1.*t)+t.^2.*exp(-1.*t);
u(1:length(t))=2;
[y1,t1]=lsim(G,u,t); %Respuesta ante un escalon usando funcion lsim
%Grafica de la respuesta
subplot(2,1,1)
plot(t1,y1,'-b',t,y,'--r','linewidth',3),grid;
legend('lsim','Ecuación temporal')
ylabel('y(t)')
subplot(2,1,2)
plot(t,u,'-r','linewidth',3),grid;
ylabel('u(t)')
xlabel('t')

fprintf('Presiona enter para continuar')
pause;


% -----------------------------------
% Respuesta temporal usando Laplace
% RAICES IGUALES
% -----------------------------------
clc; clear all
Num=conv([1 2],[1 0.5]);
Den=conv([1 5],conv([1 1],[1 3]));
G=tf(Num,Den);
[y1,t1]=step(G); %Respuesta ante un escalon usando funcion step
%Respuesta del sistema usando la ecuación temporal
t=0:0.05:8;
y=0.066667-0.3375*exp(-5.*t)+0.0625*exp(-1.*t)+0.208*exp(-3.*t);
u(1:length(t))=1;
%Grafica de la respuesta
subplot(2,1,1)
plot(t1,y1,'-b',t,y,'--r','linewidth',3),grid;
legend('step','ecuación temporal')
ylabel('y(t)')
subplot(2,1,2)
plot(t,u,'-r','linewidth',3),grid;
ylabel('u(t)')
xlabel('t')
fprintf('Presiona enter para continuar')
pause;

% -----------------------------------
% Respuesta temporal usando Laplace
% RAICES COMPLEJAS
% -----------------------------------
clear all;clc; 
%Define primer valor del heaviside en 1
sympref('HeavisideAtOrigin', 1);
% Señal de entrada
t=0:0.05:10;
u=heaviside(t)-heaviside(t-1);
% Funcion de Transferencia
Num=[1 13];
Den=[1 4 13];
G=tf(Num,Den);
% Respuesta del sistema usando la ecuación temporal
y=-1.*exp(-2*t).*cos(3*t)-(1/3).*exp(-2*t).*sin(3*t)+1 ...
    +1.*exp(-2*(t-1)).*cos(3*(t-1)).*heaviside(t-1)...
    +(1/3).*exp(-2*(t-1)).*sin(3*(t-1)).*heaviside(t-1)-heaviside(t-1);
[y1,t1]=lsim(G,u,t); %Respuesta ante un escalon usando funcion lsim
% Grafica de la respuesta
figure
subplot(2,1,1)
plot(t1,y1,'-b',t,y,'--r','linewidth',3),grid;
legend('lsim','Ecuación temporal')
ylabel('y(t)')
subplot(2,1,2)
plot(t,u,'-r','linewidth',3),grid;
ylabel('u(t)')
xlabel('t')
fprintf('Presiona enter para continuar')
pause;

% -----------------------------------
% Respuesta temporal usando Laplace
% CUARTO EJEMPLO
% -----------------------------------
clc;clear all;
%Define primer valor del heaviside en 1
sympref('HeavisideAtOrigin', 1);
% Señal de entrada
t=0:0.05:10;
u=(t-2).*heaviside(t-2)-(t-8).*heaviside(t-8)-4*heaviside(t-8);
plot(t,u,'-r','linewidth',3),grid
ylabel('u(t)');xlabel('t')
% Funcion de Transferencia
Num=2;
Den=[1 4];
G=tf(Num,Den);
% Respuesta del sistema usando la ecuación temporal
y=(1/8).*exp(-4*(t-2)).*heaviside(t-2)-(1/8).*heaviside(t-2)+(1/2).*(t-2).*heaviside(t-2)...
    +(15/8).*exp(-4*(t-8)).*heaviside(t-8)-(15/8).*heaviside(t-8)-(1/2).*(t-8).*heaviside(t-8);
[y1,t1]=lsim(G,u,t); %Respuesta ante un escalon usando funcion lsim
% Grafica de la respuesta
figure
subplot(2,1,1)
plot(t1,y1,'-b',t,y,'--r','linewidth',3),grid;
legend('lsim','Ecuación temporal')
ylabel('y(t)')
subplot(2,1,2)
plot(t,u,'-r','linewidth',3),grid;
ylabel('u(t)')
xlabel('t')
fprintf('Presiona enter para continuar')
pause;

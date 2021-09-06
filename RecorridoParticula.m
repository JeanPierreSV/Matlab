%% 
t = 0:0.1:20;
x = (4.*cos(t)+2).*cos(t);
y = (4.*cos(t)+2).*sin(t);
z = t.^2;

plot3(x,y,z,'r','linewidth',1.5)
xlabel('Eje X');ylabel('Eje Y');zlabel('Eje Z');
title('Posición de una partícula en funcion del tiempo')
grid
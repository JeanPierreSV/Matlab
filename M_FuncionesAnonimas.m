% ------------------
% Funcion anonima
% ------------------

ln = @(x)log(x)
% @ Alerta a matlab, diciendo que ln es una funcion
% () primeras parentesis van los parametros de entrada
% Se define el procedimiento matematico
% El nombre de la funcion aparecera en la ventana de variables (workspace)
% mencionada como function_hundle (manipulador de funcion)

% Para guardar la funcion
save('ln.mat','ln')
load('ln.mat')

% Funciones anonimas dentro de otras
g = @(c) (integral(@(x) (x.^2 + c*x + 1),0,1));

myfunction = @(x,y) (x^2 + y^2 + x*y);  x = 1; y = 10; z = myfunction(x,y)

% ------------------
% Ecuaciones lineales
% ------------------
% Ax = b
% Si det(A) diferente de 0, la ecuacion tiene solucion
A = [6 -3 7;4 0 9;-2 1 0];
b = [-8;0;2];
determinante_A = det(A)

x0 = inv(A)*b  % menos recomendada
x1 = A\b
x2 = A^(-1)*b
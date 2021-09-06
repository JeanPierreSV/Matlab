% Hallar las 5 raices de
format long

%Primer numero
Z1 = 25-sqrt(15)*i;
R1 = abs(Z1);

% N es el grado de la raiz y theta el argumento
N = 5; theta = angle(Z1);
% K = 0,1,2,3,4

K = 0; Raiz1=R1^(1/N)*exp((theta+2*K*pi)*i/N)
K = 1; Raiz2=R1^(1/N)*exp((theta+2*K*pi)*i/N)
K = 2; Raiz3=R1^(1/N)*exp((theta+2*K*pi)*i/N)
K = 3; Raiz4=R1^(1/N)*exp((theta+2*K*pi)*i/N)
K = 4; Raiz5=R1^(1/N)*exp((theta+2*K*pi)*i/N)

compass(Raiz1)
compass(Raiz2)
compass(Raiz3)
compass(Raiz4)
compass(Raiz5)



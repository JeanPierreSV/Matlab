fprintf('---JUEGO DE AZAR : ADIVINA EL NUMERO-----\n')
fprintf('Tengo un numero del 1 al 1000\n')
fprintf('Puedes adivinar que numero es?\n')

azar  = randi([0,1000],1,1);
numero = input('Escriba su primer intento: ');
contar = 0;

while 1
    if azar == numero
        contar=contar+1;
        disp('¡Excelente!, ¡Adivinaste el numero!')
        fprintf('Numero de intentos: %i\n',round(contar))
        break
    elseif azar > numero
        contar=contar+1;
        disp('¡Demasiado bajo!, Vuelve a intentarlo!')
        fprintf('\n')
    elseif azar < numero
        contar=contar+1;
        disp('¡Demasiado alto!, Vuelve a intentarlo!')
        fprintf('\n')
    end
    numero = input('Escriba su siguiente intento: ');
end

clc; clear all; close all;
prompt = {'Conductor1 = AAAC y Conductor2 = ACSR','Temperatura de cada dia (°C)','Esfuerzo de cada dia - EDS (kg/mm2)','Esfuerzo de pretensado (% del EDS)','Horas de pretensado','Años de operacion'};
def = {'1','15','5.04','70','27','25'};
digTitle = 'Datos para el cálculo';
lineNo = 1;

answer = inputdlg(prompt,digTitle,lineNo,def);
conductor  = str2num(answer{1});  % Conductor1=AAAC  Conductor2=ACSR
tempdia    = str2num(answer{2});  % Temperatura cada dia
eds        = str2num(answer{3});  % EDS Kg/mm2
pretensado = str2num(answer{4});  % % del EDS
horas      = str2num(answer{5});  % Horas de pretensado
aopera     = str2num(answer{6});  % Años de operacion

fprintf(2,'EFECTO CREEP EN CONDUCTORES PARA LINEAS DE TRANSMISION: \n\n');

fprintf(2,'Temperatura de cada dia     = %.2f °C\n', tempdia);
fprintf(2,'Esfuerzo de cada dia    EDS = %.2f kg/mm2\n', eds);
fprintf(2,'Esfuerzo de pretensado      = %.0f por ciento del EDS\n',pretensado);
fprintf(2,'Horas de pretensado         = %.0f horas\n',horas);
fprintf(2,'Años de operacion           = %.0f años\n',aopera);

if conductor == 1 % AAAC
    tipo = 'AAAC';
    k    = 0.15;
    fi   = 1.4;
    alfa  = 1.3;
    u      = 0.16;
    cdilat = 0.000023; % COef. de dilatacion termica

fprintf(2,'Datos del conductor: \n\n');
fprintf(2,'Tipo                                   = %.2f\n','tipo' );
fprintf(2,'Constante del material del conductor k = %.2f\n', k);
fprintf(2,'Constante                           fi = %.2f\n', fi);
fprintf(2,'Constante                         alfa = %.2f\n', alfa);
fprintf(2,'Constante                           mu = %.2f\n', u);
fprintf(2,'Coef. dilatacion termica        cdilat = %.8f 1/°C\n', cdilat);



elseif conductor == 2 % ACSR
    tipo = 'ACSR';
    k    = 1.4;
    fi   = 0.0;
    alfa   = 1.3;
    u      = 0.16;
    cdilat = 0.00001944; % COef. de dilatacion termica
    

fprintf(2,'Datos del conductor: \n\n');

fprintf(2,'Tipo                                   = %.2f\n','tipo' );
fprintf(2,'Constante del material del conductor k = %.2f\n', k);
fprintf(2,'Constante                           fi = %.2f\n', fi);
fprintf(2,'Constante                         alfa = %.2f\n', alfa);
fprintf(2,'Constante                           mu = %.2f\n', u);
fprintf(2,'Coef. dilatacion termica        cdilat = %.8f 1/°C\n', cdilat);

else
    fprintf('ERROR : Solo son dos opciones: Conductores ACSR o AAAC \n');
    fprintf('FIN DEL PROGRAMA');
    return; 
end






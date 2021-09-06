clc; clear all; close all;
prompt = {'Peso unitario (Kg/m)','Tiro To1(Kg)','Tiro To2(Kg)','Tiro To3(Kg)','Tiro To4(Kg)','Tiro To5(Kg)'};
def = {'0.7','500','600','700','800','900'};
digTitle = 'Datos para el cálculo';
lineNo = 1;

answer = inputdlg(prompt,digTitle,lineNo,def);
to1    = str2num(answer{1});
to2    = str2num(answer{2});
to3    = str2num(answer{3});
to4    = str2num(answer{4});
to5    = str2num(answer{5});

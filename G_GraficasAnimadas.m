%% Ejemplo de Graficas Animadas en MATLAB
function varargout=animacion(varargin)
parar=false;FCos=false;

%CREAMOS EL AXE le establece nombre, posición y color
% padre  / unidades / tamaño del axe  /  limites xy / rejilla
fig(1)=figure('name','Monitor','menubar','none','position',[200 200 800 700],'color',[0.9 0.6 0.3])

%Comando que mueve la figura al Centro de la pantalla
movegui(fig(1),'center');

%Crea un AXE, dentro de la Figura, establece la posicion y los limites
axe(1)=axes('parent',fig(1),'units','pixels','position',[60 80 600 550],'xlim',[0 40],'ylim',[-3 3],'xgrid','on','ygrid','on')

%MODIFICA las etiquetas del eje x y y de el AXE
% Set:colocar / get :obtener
set(get(axe(1),'XLabel'),'String','Tiempo (Seg)')
set(get(axe(1),'YLabel'),'String','Función')

%Crea las lineas que se van a graficar en el axe, con su color y grosor
%correspondientes
lin(1)=line('parent',axe(1),'xdata',[],'ydata',[],'Color','r','LineWidth',2.5);
lin(2)=line('parent',axe(1),'xdata',[],'ydata',[],'Color','k','LineWidth',2);
txbx(1)=uicontrol('parent',fig(1),'style','text','string','Función Seno','position',[680 170 100 50],'background',[0.9 0.6 0.3],'callback',@texto,'fontsize',11)
txbx(2)=uicontrol('parent',fig(1),'style','text','string','Seno','position',[680 150 100 50],'callback',@texto,'fontsize',11)
txbx(3)=uicontrol('parent',fig(1),'style','text','string','Función Coseno','position',[680 270 100 50],'background',[0.9 0.6 0.3],'callback',@texto,'fontsize',11)
%Crea botones y cuadros de texto dentro de la figura.
bot(1)=uicontrol('parent',fig(1),'style','pushbutton','string','Detener','position',[680 50 100 50],'callback',@stop,'fontsize',11)
bot(2)=uicontrol('parent',fig(1),'style','pushbutton','string','Coseno','position',[680 250 100 50],'callback',@coseno,'fontsize',11)
%% Funcion PARAR
function varargout=stop(hObject,evendata)
parar=true;
end
%% Funcion Graficar Coseno
function varargout=coseno(hObject,evendata)
FCos=true;
end
%% funcion Graficar
% function varargout=grafique(hObject,evendata)
tiempo=[0];
salida=[0];
salida2=[0];
%Cada cuanto se va graficando en el axe
dt=0.1;
%Limites iniciales en el AXE
limx=[0 40];
set(axe(1),'xlim',limx);
%% Grafico
k=1;nit = 800;
while(~parar)
Y=2*sin(tiempo(k));
Z=cos(4*tiempo(k)); %Crea función Coseno y lo guarda en Z
if FCos == true
set(bot(2),'string',Z);
end
set(txbx(2),'string',Y);
%Actualiza las variables del grafico
tiempo=[tiempo tiempo(end)+dt];
salida=[salida Y];
salida2=[salida2 Z];
if FCos == true
set(lin(2),'xdata',tiempo,'ydata',salida2);
end
%Grafico con las lineas creadas anteriormente
set(lin(1),'xdata',tiempo,'ydata',salida);
pause(dt); %% espera 0.1 seg para cada interación
if tiempo(end)>=limx % actualizo grafica cuando llega a su limite en tiempo real
limx=[0 limx(2)+40]
set(axe(1),'xlim',limx) 
end
k=k+1;
if(k==nit)
parar=true;
end
end
parar=false;
% end
end
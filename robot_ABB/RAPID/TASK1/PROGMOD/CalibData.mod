MODULE CalibData
    	!POSICION DE CARGA Y DESCARGA
    TASK PERS wobjdata pale:=[FALSE,TRUE,"",[[344.8,116.872,21.612],[0.000039496,-0.000013233,-1,0.000083955]],[[0,0,0],[1,0,0,0]]];    !posicion pale leida por la camara
    TASK PERS wobjdata descarga:=[FALSE,TRUE,"",[[346.861,115.463,54.8953],[2.87687E-05,4.15206E-05,1,-1.0278E-05]],[[0,0,0],[1,0,0,0]]];   !datos del lugar en el que se descargan las piezas
    
    !PIEZA
    TASK PERS loaddata pieza:=[1,[10,0,0],[1,0,0,0],0,0,0];     !datos de la pieza
    
    !HERRAMIENTAS. Todas las herramientas estan montadas a la vez. Los unicos datos que varian entre ellas son los de la poiscion del tcp
    TASK PERS tooldata ventosa:=[TRUE,[[2.50494,-0.694668,218.922],[0.924843,-0.00331838,-0.00807098,-0.380249]],[1,[0,0,1],[1,0,0,0],0,0,0]];     !datos de la herramienta
    TASK PERS tooldata camara:=[TRUE,[[-64.8213,-67.6793,156.417],[0.924843,-0.00331838,-0.00807098,-0.380249]],[1,[0,0,1],[1,0,0,0],0,0,0]];    !datos de la camara
    TASK PERS tooldata sensor:=[TRUE,[[74.2693,63.2177,111.275],[0.924843,-0.00331838,-0.00807098,-0.380249]],[1,[0,0,1],[1,0,0,0],0,0,0]];     !datos de la sensor
    
    !TASK PERS tooldata sensor:=[TRUE,[[68.2693,68.2177,111.275],[0.91706,0,0,-0.398749]],[1,[0,0,1],[1,0,0,0],0,0,0]];     !datos de la sensor
    
    
    !PARAMETROS
    CONST speeddata vel_rapido:=v800;       !velocidad rapida
    CONST speeddata vel_lento:=v100;       !velocidad lento
    CONST zonedata zona:=z10;       !ajuste puntos    
    
    
    !DATOS 
    VAR num sentido:=1;
    VAR num margen:=50; !distancia entre los puntos coger/dejar y sus superiores en mm
    VAR num espuma:=18;   !ancho de la espuma
    VAR num tiempo_espera:=1;   !tiempo en segundos que el robot espera para que la ventosa cargue o descargue la pieza
ENDMODULE
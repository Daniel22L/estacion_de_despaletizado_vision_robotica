MODULE Funciones
        !sacados de la camara
    !distancias en mm y angulos en grados. NO SE SI LOS MILIMETROS NO LOS MARCA BIEN?????????????????
    
    VAR num I_pale_x:=0;
    VAR num I_pale_y:=0;
    VAR num I_pale_z:=0;
    VAR num I_pale_a:=0;
    VAR num I_pale_b:=0;
    VAR num I_pale_c:=0;
    
    
    !pieza
    VAR num I_pieza_x:=0;
    VAR num I_pieza_y:=0;
    VAR num I_pieza_z:=0;
    VAR num I_pieza_a:=0;
    VAR num I_pieza_b:=0;
    VAR num I_pieza_c:=0;
    
    VAR num inicializacion:=0;
    VAR num sensor_pale_ini:=0;
    VAR num camara_pale_ini:=0;
    VAR num sensor_pale:=0;
    VAR num camara_pale:=0;
    VAR num sensor_pieza:=0;
    VAR num coge_pieza:=0;
    VAR num mueve_pieza:=0;
    VAR num deja_pieza:=0;
    VAR num finaliza:=0;
   
    
    PROC Iniciar()   !incorporo los datos de arranque que el PLC envie
        GripLoad load0;
        visualizacion:=visualizacion_ini;
        sentido:=1;      
        MoveJ home,vel_rapido,zona,ventosa\WObj:=wobj0;
    ENDPROC
    
    PROC Posicionar_sensor_pale_ini()
        MoveJ  visualizacion_ini,vel_rapido,fine,sensor\WObj:=pale; !me posiciono para buscar el pale con el sensor. Con el dato del sensor corrijo altura
        WaitTime tiempo_espera; !espero para que el valor del sensor se estabilice
    ENDPROC
    
    PROC Posicionar_sensor()
        MoveJ visualizacion,vel_rapido,fine,sensor\WObj:=pale; !me posiciono en el punto de visualizacion con el sensor. No hago movimientos relativos porque el punto está actualizado
        WaitTime tiempo_espera; !espero para que el valor del sensor se estabilice
    ENDPROC
    
    PROC Posicionar_camara()
        MoveJ RelTool (visualizacion, I_pale_x, I_pale_y, I_pale_z \Rx:=I_pale_a \Ry:=I_pale_b \Rz:=I_pale_c ),vel_rapido,fine,camara\WObj:=pale; !me posiciono para ver las piezas. Corrijo datos de vision
        visualizacion:=CRobT(\Tool:=camara \WObj:=pale); !actualizo el punto
        WaitTime 2*tiempo_espera; !espero para que el valor del sensor se estabilice
    ENDPROC
    
    
    PROC Ir_centro_pieza()  !voy al centro de la pieza con el sensor a la aluta de visualizacion, por eso el parametro de avance en Z está a 0
        MoveJ RelTool (visualizacion, I_pieza_x, I_pieza_y, 0 \Rx:=I_pieza_a \Ry:=I_pieza_b \Rz:=I_pieza_c), vel_rapido,fine,sensor\WObj:=pale; !voy al centro de la pieza a la altura de vision para guardar a que altura esta cada pieza
        WaitTime tiempo_espera; !espero para que el valor del sensor se estabilice   
    ENDPROC
    
    
    PROC Coger_pieza()
        MoveJ RelTool (visualizacion, I_pieza_x, I_pieza_y, I_pieza_z - margen \Rx:=I_pieza_a \Ry:=I_pieza_b \Rz:=I_pieza_c), vel_rapido,zona,ventosa\WObj:=pale;  !voy encima de la pieza a una diferencia de altura de margen
        MoveL RelTool (visualizacion, I_pieza_x, I_pieza_y, I_pieza_z + espuma \Rx:=I_pieza_a \Ry:=I_pieza_b \Rz:=I_pieza_c), vel_lento,fine,ventosa\WObj:=pale; !bajo hasta la pieza la distancia margen en Z
        !WaitTime tiempo_espera;
    ENDPROC
    
    PROC Mover_pieza()
        GripLoad pieza; !le indico al robot que ahora lleva la pieza. Necsario para que calcule la dinamica teniendo en cuenta la pieza
        MoveL RelTool (visualizacion, I_pieza_x, I_pieza_y, I_pieza_z - margen \Rx:=I_pieza_a \Ry:=I_pieza_b \Rz:=I_pieza_c), vel_lento,zona,ventosa\WObj:=pale;  !voy encima de la pieza a una diferencia de altura de margen
        MoveJ esquivar_iluminacion,vel_rapido,zona,ventosa\WObj:=pale;!paso por este punto para no chocar con la iluminacion
        MoveJ Offs(deja,0,0,-margen),vel_rapido,zona,ventosa\WObj:=descarga; !voy a un punto por encima del punto de descarga
        MoveL deja,vel_lento,fine,ventosa\WObj:=descarga;   !bajo al punto de descarga
        !WaitTime tiempo_espera;
    ENDPROC
    
    PROC Dejar_pieza()
        GripLoad load0; !le indico al robot que descargue
        MoveJ Offs(deja,0,0,-margen),vel_lento,zona,ventosa\WObj:=descarga;  !voy a un punto por encima del punto de descarga
        MoveJ esquivar_iluminacion,vel_rapido,zona,ventosa\WObj:=pale;!paso por este punto para no chocar con la iluminacion
    ENDPROC
    
    PROC Fin()
         MoveJ home,vel_rapido,zona,ventosa\WObj:=wobj0;
    ENDPROC
    
    
    
    !lectura de variables
    FUNC dnum leerInt32(dnum value)
        IF value > 2147483647 THEN
            RETURN (value-4294967296);
        ELSE
            RETURN value;
        ENDIF
    ENDFUNC

ENDMODULE
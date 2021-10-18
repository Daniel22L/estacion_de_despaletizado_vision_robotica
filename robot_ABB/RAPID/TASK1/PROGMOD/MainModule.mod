MODULE MainModule
    PROC main()    
        
                !datos de la calibracion de la orientacion de las herramientas
            !camara.tframe.rot:=OrientZYX(-44.7,-1,0); 
            !sensor.tframe.rot:=OrientZYX(-44.7,-1,0);  
            !ventosa.tframe.rot:=OrientZYX(-44.7,-1,0);
            
              
        
        IF DI_inicializacion=1 OR DI_sensor_pale_ini=1 OR DI_camara_pale_ini=1 OR DI_sensor_pale=1 OR DI_camara_pale=1 or DI_sensor_pieza=1 OR DI_coge_pieza=1 OR DI_mueve_pieza=1 OR DI_deja_pieza=1 OR DI_finaliza=1 THEN  !reseteo todas las variables de salida  
        
            !Guardo los estados de las variables por si varian en medio de un ciclo
            inicializacion:=DI_inicializacion;
            sensor_pale_ini:=DI_sensor_pale_ini;
            camara_pale_ini:=DI_camara_pale_ini;
            sensor_pale:=DI_sensor_pale;
            camara_pale:=DI_camara_pale;
            sensor_pieza:=DI_sensor_pieza;
            coge_pieza:=DI_coge_pieza;
            mueve_pieza:=DI_mueve_pieza;
            deja_pieza:=DI_deja_pieza;
            finaliza:=DI_finaliza;
            
            
            
        !Pongo a 0 todas las salidas
            Reset DO_inicializado;
            Reset DO_sensor_pale_ini;
            Reset DO_camara_pale_ini;
            Reset DO_sensor_pale;
            Reset DO_camara_pale;
            Reset DO_sensor_pieza;
            Reset DO_pieza_cogida;
            Reset DO_pieza_movida;
            Reset DO_pieza_dejada;
            Reset DO_finalizado;
            
            I_pieza_x:=DnumToNum(leerInt32(GInputDnum(GI_pieza_x)))/100;
            I_pieza_y:=DnumToNum(leerInt32(GInputDnum(GI_pieza_y)))/100;
            I_pieza_z:=DnumToNum(leerInt32(GInputDnum(GI_pieza_z)))/100;
            I_pieza_a:=DnumToNum(leerInt32(GInputDnum(GI_pieza_a)))/100;
            I_pieza_b:=DnumToNum(leerInt32(GInputDnum(GI_pieza_b)))/100;
            I_pieza_c:=DnumToNum(leerInt32(GInputDnum(GI_pieza_c)))/100;
            
            I_pale_x:=DnumToNum(leerInt32(GInputDnum(GI_pale_x)))/100;
            I_pale_y:=DnumToNum(leerInt32(GInputDnum(GI_pale_y)))/100;
            I_pale_z:=DnumToNum(leerInt32(GInputDnum(GI_pale_z)))/100;
            I_pale_a:=DnumToNum(leerInt32(GInputDnum(GI_pale_a)))/100;
            I_pale_b:=DnumToNum(leerInt32(GInputDnum(GI_pale_b)))/100;
            I_pale_c:=DnumToNum(leerInt32(GInputDnum(GI_pale_c)))/100;


            IF inicializacion=1 THEN
                Iniciar;
                Set DO_inicializado;
        
            ELSEIF sensor_pale_ini=1 THEN !pone el sensor sobre donde supone que debe estar el pale
                Posicionar_sensor_pale_ini;
                Set DO_sensor_pale_ini;     !indica al PLC que la camara esta en posicion
                
            ELSEIF camara_pale_ini=1 THEN    !pone la camara a la aluta correcta para buscar el pale
                Posicionar_camara;
                Set DO_camara_pale_ini;

            ELSEIF camara_pale=1 THEN    !pone la camara sobre el pale esta vez con los datos de su centro
                Posicionar_camara;
                Set DO_camara_pale;     
            
            ELSEIF sensor_pieza=1 THEN   !pone el sensor sobre el pale
                Ir_centro_pieza;
                Set DO_sensor_pieza;

            ELSEIF coge_pieza=1 THEN !coge la pieza
                Coger_pieza;
                Set DO_pieza_cogida;
                !WaitTime 0.1*tiempo_espera; !espero a que la ventosa se active y espero a que se hagan las comunicaciones con el PC. Sino, el PLC enciende y apaga una orden demasiado rapido
            
            ELSEIF mueve_pieza=1 THEN    !mueve la pieza hasta el sitio de descarga
                Mover_pieza;
                Set DO_pieza_movida;
                !WaitTime 0.1*tiempo_espera; !espero a que se desactive la ventosa y se hagan las comunicaciones con el PC
                
            ELSEIF deja_pieza=1 THEN !deja la pieza en el sitio de descarga
                Dejar_pieza;
                Set DO_pieza_dejada;
       
            ELSEIF finaliza=1 THEN   !acaba el pale
                Fin;
                Set DO_finalizado;
                
             ELSEIF DI_sensor_pale=1 THEN   !pone el sensor sobre el centro del pale
                Posicionar_sensor;
                Set DO_sensor_pale;
            ENDIF
            
        ENDIF
        
	ENDPROC
    
ENDMODULE
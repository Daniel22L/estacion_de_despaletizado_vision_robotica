MODULE Points
    CONST robtarget home:=[[-457.71,129.67,909.64],[0.548925,-0.112085,-0.824308,-0.0814577],[1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];  !posicon de inicio  
	CONST robtarget deja:=[[-343.71,-51.44,326.26],[0.00436709,-0.0100748,0.00438916,-0.99993],[0,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];      !punto donde se deja la pieza
    VAR robtarget visualizacion_ini:=[[351.91,474.44,-603.27],[0.704796,-0.00470417,-0.0103333,0.709319],[1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];    !punto de visualizacion con respecto al pale
    VAR robtarget visualizacion:=[[351.91,474.44,-603.27],[0.704795,-0.00470493,-0.0103332,0.70932],[1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];    !punto de visualizacion con respecto al pale
    VAR robtarget esquivar_iluminacion:=[[49.12,379.20,-686.98],[0.438332,-0.0124791,-0.0171508,0.898563],[0,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];    !punto de visualizacion con respecto al pale
        
    PROC borrar()
        MoveL deja,v1000,z100,ventosa\WObj:=descarga;
        MoveL home,v1000,z100,ventosa\WObj:=wobj0;
        MoveL visualizacion,v1000,z100,ventosa\WObj:=pale;
    ENDPROC
!variable para modificar el wobj pale. Igualo el wobj a este punto
ENDMODULE
; Directivas 
#Persistent
#NoEnv

SoundBeep 750, 500 ; Nos avisa que el script se ejecuto correctamente
DllCall("timeBeginPeriod", UInt, 1) ; Llamada a una funcion dll muy basica

; Establecer prioridad del compilador con REALTIME_PRIORITY_CLASS
Process, Priority, , R

SetTitleMatchMode, 2  
SetTitleMatchMode, Fast ; Alternacion del modo rapido para las teclas
Tiempo := 15.6 ; El tiempo en ms en este caso los servidores de l4d2 corren a 64 ticks (zonemod server suelen ir a mayores velocidades)
exit_key := "End" ; Boton para desactivar la macro run
activation_key := "xButton1" ; puede ser cambiado por otra macro revisar la documentacion de autohotkey

; Bucle principal (tecla de salida)

While !GetKeyState(exit_key, "P") 
{
    ; Condicional tecla de activacion
    If GetKeyState(activation_key, "P") 
    {
        Send,{space}
        Sleep, % (Tiempo * 1) ; Multiplica los ms del tick por 1 para el disparador de la tecla space

        Send,{space}
	; bucle para el disparador infinito
        While GetKeyState(activation_key, "P")
        {
            Send,{space}
	    ; Multiplica los ms del tick por 2 para el disparador de la tecla space
            Sleep, % (Tiempo * 3)
        }
    }
    else
    {
        Sleep, 1 ; Fin del proceso
    }
}

DllCall("timeEndPeriod", UInt, 1) ; Llamada de salida a una dll
ExitApp
/* BASURA EN EL CODIGO SIEMPRE ES BUENO PONER BASURA EN EL CODIGO PARA EVITAR POSIBLES LEIDAS DE MEMORIA DE ALGUN ANTICHEAT
-----
-----


-----
-----


----
*/
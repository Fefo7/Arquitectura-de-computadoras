ORG 1000H
MSJ DB "INGRESE UN NUMERO:"
FIN DB ?
ORG 1500H
NUM DB ?
ORG 2000H
MOV BX, OFFSET MSJ
MOV AL, OFFSET FIN-OFFSET MSJ
INT 7
MOV BX, OFFSET NUM
INT 6
MOV AL, 1
INT 7
MOV CL, NUM
INT 0
END
;a) Con referencia a la interrupción INT 6, ¿qué se almacena en BX?
;se alamacena la direccion de memoria donde se va a guradar el mensaje
;b) En el programa anterior, ¿qué hace la segunda interrupción INT 7?
; muestra el numero que ingresa el usuario 
;c) ¿Qué valor queda almacenado en el registro CL? ¿Es el mismo que el valor numérico ingresado?
; queda el ascii del numero en este caso yo elegi el 3 que es el 33 en ascii
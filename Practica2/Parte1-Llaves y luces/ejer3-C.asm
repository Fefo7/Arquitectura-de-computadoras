;Control de luces mediante llaves Escribir un programa que permite encender y apagar las luces
;mediante las llaves. El programa no deberá terminar nunca, y continuamente revisar el estado de las
;llaves, y actualizar de forma consecuente el estado de las luces. La actualización se realiza simplemente
;prendiendo la luz i, si la llave i correspondiente está encendida (valor 1), y apagándola en caso
;contrario. Por ejemplo, si solo la primera llave está encendida, entonces solo la primera luz se debe
;quedar encendida

PA equ 30h
PB equ 31H
CA equ 32H
CB equ 33H
org 1000h

org 2000h
;configurar bits de CA y CB
  mov AL, 0FFH
  out CA, AL
  mov al, 0
  out CB, al

  ;los dejo en sus estados originales
  mov al, 0
  out PA, al
  out PB, al


  ; aca hago la magia
  loop: in al, PA
  out PB,al
   jmp loop 

fin: int 0
end
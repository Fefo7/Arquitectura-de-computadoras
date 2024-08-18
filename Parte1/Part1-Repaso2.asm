org 1000H
c dw 40h
res db 0

org 2000h

cmp c, 41h
jns comprobar 
js asig
asig: mov res, 0
jmp fin

comprobar: 
  cmp c,41h
  jns isMayus
  js asig

isMayus:
  mov res, 0ffH
  jmp fin 
  
fin:
  hlt
end
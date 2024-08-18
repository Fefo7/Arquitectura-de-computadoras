org 1000H
c db "D"
maxZ dw 5Ah
maxzm dw 7Ah
result dw 0

org 2000h
mov ax, maxZ
sub al,c
mov dx, maxzm
sub dx, ax
mov result, dx


hlt
end
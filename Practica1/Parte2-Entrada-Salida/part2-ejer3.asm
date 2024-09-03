;A)
ORG 1000H
A DB "HO LA"
B DB ?
ORG 2000H
mov bx, offset A
mov al, offset b- offset A
int 7
int 0
END
;C)
;ORG 1000H
;A DB "ARQ"
;B DB ?
;ORG 2000H
;mov al, 3
;mov bx, offset A
;int 7
;int 0
;END
;D)
;ORG 1000H
;A DB "HOLA"
;B DB ?
;ORG 2000H
;mov al, offset B - offset A
;mov bx, offset A
;int 7
;int 0
;end
;E)
;ORG 1000H
;A DB ?
;ORG 2000H
;mov bx, offset A
;int 6
;mov al, 1
;int 7
;int 0
;END
;F)
;ORG 1000H
;A DB ?
;ORG 2000H
;mov bx, offset A
;int 6
;mov al, 1
;int 7
;int 0
;END
;G)
;ORG 1000H
;A DB ?
;ORG 2000H
;mov bx, offset A
;int 6
;mov al, 1
;int 7
;int 0
;end
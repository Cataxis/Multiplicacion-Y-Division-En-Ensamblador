.MODEL SMALL
.STACK


.DATA
    numero1 DB 0
    numero2 DB 0
    resultado DB 0


    mensaje1 DB 10,13,7, 'Multiplicacion: $'
    mensaje2 DB 10,13,7, 'Division: $'


    mensaje0 DB 10,13,7, 'Ingresa un numero: $'


.CODE
    mov AX, seg @DATA
    mov DS, AX


    mov ah, 09H
    lea dx, mensaje0
    int 21H


    mov ah, 01H
    int 21H
    sub al, 30H
    mov numero1,al


    mov ah, 09H
    lea dx, mensaje0
    int 21H


    mov ah, 01H
    int 21H
    sub al, 30H
    mov numero2,al


    ;Multiplicación


    mov al, numero1
    mov bl, numero2
    mul bl
    mov resultado, al


    mov ah, 09H
    lea dx, mensaje1
    int 21H


    mov al, resultado
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, BH
    add dl, 30H
    int 21H


    mov ah, 02h
    mov dl, BL
    add dl, 30H
    int 21H


    ;División
    xor ax, ax
    mov bl, numero2
    mov al, numero1
    div bl
    mov resultado, al


    mov ah, 09H
    lea dx, mensaje2
    int 21H


    mov al, resultado
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, BH
    add dl, 30H
    int 21H


    mov ah, 02h
    mov dl, BL
    add dl, 30H
    int 21H


    int 27H
END

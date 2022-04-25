DATA SEGMENT

    a1 db "  ! Welcome To the Cosmetic Store! $  "
    a2 db 10, 13, 10, 13, "Which cosmetic product you want?? Select:$"
    a3 db 10, 13, 10, 13, "1. Face wash Rs100  2. Beard oil Rs150 3. Bathing Gel Rs250 : $"
    a4 db 10, 13, 10, 13, "Enter the Quantity: $"
    a5 db 10, 13, 10, 13, "Total Price of purchase: $"
    a6 db 10, 13, 10, 13, "* THANK YOU * $"
    a7 db 10, 13, 10, 13, "Re-Order: Press 1 $"
    a8 db 10, 13, 10, 13, "Press any key to exit $"
    a9 db 10, 13, 10, 13, "Product in stock: $"
    a10 db 10, 13, 13, 13, "Product in stock now: $"

    s1 dw 100
    s2 dw 100
    s3 dw 100

    price1 dw 100
    price2 dw 150
    price3 dw 250

    total_price db ?

DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    START:
	MOV AX, DATA 
	MOV DS, AX

	MOV AH, 9
	LEA DX, a1
	INT 21H

	start1:

	    mov ah, 9
	    lea dx, a2
	
	MENU:
	    MOV ah, 9
	    LEA DX, a3
	    INT 21H

	    mov ah, 1
	    int 21H

	    cmp al, 31h
	    je face
	    cmp al, 32h
	    je beard
	    cmp al, 33h
	    je bath

	face:

	    MOV ah, 9
	    LEA DX, a9
	    INT 21H

	    xor AX, AX
	    MOV AX, [s1]
	    CALL print

	    MOV ah, 9
	    LEA DX, a4
	    INT 21H

	    XOR AX, AX
	    XOR BX, BX

	    xor cx, cx
	    MOV CX, [s1]
	    
	    MOV AH, 1
	    INT 21H
	    MOV BL, 100
	    MOV BH, 30H
	    SUB AL, BH
	    MOV BH, AL

	    XOR AX, ax
	    MOV AL, BH

	    SUB CX, AX
	    MOV s1, CX

	    XOR AX, AX
	    MOV AL, BH
	    MUL BL

	    PUSH AX

	    MOV ah, 9
	    LEA DX, a10
	    INT 21H

	    XOR AX, AX
	    xor AX, AX
	    MOV AX, [s1]
	    CALL print

	    jmp totalprice
	
	beard:
	    MOV ah, 9
	    LEA DX, a9
	    INT 21H

	    xor AX, AX
	    MOV AX, [s2]
	    CALL print

	    MOV ah, 9
	    LEA DX, a4
	    INT 21H

	    XOR AX, AX
	    XOR BX, BX

	    xor cx, cx
	    MOV CX, [s2]
	    
	    MOV AH, 1
	    INT 21H
	    MOV BL, 150
	    MOV BH, 30H
	    SUB AL, BH
	    MOV BH, AL

	    XOR AX, ax
	    MOV AL, BH

	    SUB CX, AX
	    MOV s2, CX

	    XOR AX, AX
	    MOV AL, BH
	    MUL BL

	    PUSH AX

	    MOV ah, 9
	    LEA DX, a10
	    INT 21H

	    XOR AX, AX
	    xor AX, AX
	    MOV AX, [s2]
	    CALL print

	    jmp totalprice

	bath:
	    MOV ah, 9
	    LEA DX, a9
	    INT 21H

	    xor AX, AX
	    MOV AX, [s3]
	    CALL print

	    MOV ah, 9
	    LEA DX, a4
	    INT 21H

	    XOR AX, AX
	    XOR BX, BX

	    xor cx, cx
	    MOV CX, [s3]
	    
	    MOV AH, 1
	    INT 21H
	    MOV BL, 250
	    MOV BH, 30H
	    SUB AL, BH
	    MOV BH, AL

	    XOR AX, ax
	    MOV AL, BH

	    SUB CX, AX
	    MOV s3, CX

	    XOR AX, AX
	    MOV AL, BH
	    MUL BL

	    PUSH AX

	    MOV ah, 9
	    LEA DX, a10
	    INT 21H

	    XOR AX, AX
	    xor AX, AX
	    MOV AX, [s3]
	    CALL print

	    jmp totalprice


	totalprice:
	    MOV AH, 9
	    LEA DX, a5
	    INT 21H

	    XOR AX, AX
	    pop AX
	    ;MOV total_price, AX
	    CALL print

	    mov ah, 9
	    LEA DX, a7
	    INT 21H

	    mov ah, 9
	    LEA DX, a8
	    INT 21H

	    MOV AH, 1
	    INT 21H

	    cmp al, 31h
	    je start1

	    MOV ah, 9
	    LEA DX, a6
	    INT 21H

	    mov ah, 4ch
	    int 21h


print PROC
    mov cx, 0
    mov dx, 0
    label1:
	cmp ax, 0
	je print1
	mov bx, 10
	div bx
	push dx
	inc cx
	xor dx, dx
	jmp label1
    print1:
	cmp cx, 0
	je Exit
	pop dx
	add dx, 48
	mov ah, 02h
	int 21H
	dec cx
	jmp print1
    exit:
    ret
print ENDP


CODE ENDS
END START




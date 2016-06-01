Stack1 segment
	db 128 dup(?)
Stack1 ends
Data segment
Data ends
Code segment
Start: Assume SS:Stack1, DS:Data, CS:Code
mov ax,data
mov ds,ax
mov ah,00h
mov al,12h
Int 10h
;------------------------------V
ver_line macro x1,y1,c,y2
Local a1
mov ah,0ch
mov dx,y1
mov cx,x1
mov al,c
a1: Int 10h

Inc dx
cmp dx,y2
jne a1
Endm
;------------------------------G
gor_line macro x1,y1,c,x2
Local a2
mov ah,0ch
mov dx,y1
mov cx,x1
mov al,c
a2: Int 10h

Inc cx
cmp cx,x2
jne a2
Endm
;-------------------------------di
diag_line macro x1, y1, c, x2
local Z1
	mov ah, 0ch
	mov dx, y1
	mov cx, x1
	mov al, c; 
Z1:	int 10h
	inc cx
	dec dx
	cmp cx, x2
	jne Z1
endm
;--------------------------------Zal
Zal macro xN , yN, Xk, Yk, c, i, j
	local a1
	mov ah, 0ch 
	mov cx, xN		; запись пикселя(знака)
	mov dx, yN
	mov al, c 		; цвет пикселя
	
	mov bx, Yk	
a1: int 10h	
	add dx, j
	cmp dx, bx
		jne a1	
	
	add cx, i
	mov dx, yN
	 	
	cmp cx, Xk
		jne a1
endm
;------------------------ 3D ten
Zal3D macro xN , yN, Xk, Yk, c, i, j
	local a1
	mov ah, 0ch 
	mov cx, xN		; запись пикселя(знака)
	mov dx, yN
	mov al, c 		; цвет пикселя
	
	mov cx, xN
	mov bx, Yk	
a1: int 10h	
	add dx, j
	cmp cx,Xk
	jne a2	
	
	add cx, i
	mov cx, xN+1
	cmp cx, Xk
	jne a3

a2: inc cx
	jmp a1
a3: endm
;------------------------
ver_line 100,100,14,250
gor_line 100,100,14,120
ver_line 120,100,14,250
gor_line 100,250,14,120

diag_line 100,100,6,120;-3dt;---------
diag_line 120,100,6,140;-3dt
gor_line 120,80,6,140;-3dt
ver_line 140,80,6,142;-3dt
diag_line 120,160,6,140;-3dt
ver_line 140,180,6,232;-3dt
diag_line 120,250,6,140;-3dt
gor_line 140,140,6,200;-3dt

gor_line 120,160,14,200
gor_line 120,180,14,200

ver_line 200,100,14,250
gor_line 200,100,14,220
ver_line 220,100,14,250
gor_line 200,250,14,220

diag_line 200,100,6,220;-3dt
diag_line 220,100,6,240;-3dt
gor_line 220,80,6,240;-3dt
ver_line 240,80,6,232;-3dt
diag_line 220,250,6,240;-3dt
;-----------------------------------
;		xN,   yN,    Xk,   Yk,    c,    i,   j
Zal     101,  101,   120,  250,   150,  1,   1
Zal     201,  101,   220,  250,   150,  1,   1
Zal     121,  161,   200,  180,   150,  1,   1

;		xN ,  yN,    Xk,   Yk,    c,    i,   j
;Zal3D 	101,   100,   120,  150,   10,  2,   -1
;-----------------------------------
mov ah,10h
int 16h
mov ah,4ch
Int 21h

Code ends
end Start
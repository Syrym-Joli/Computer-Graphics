Include io.asm
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
mov al,13h
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

ver_line 10,10,3,100
gor_line 10,50,3,60
ver_line 60,10,3,100

mov ah,10h
Int 21h

Code ends
end Start
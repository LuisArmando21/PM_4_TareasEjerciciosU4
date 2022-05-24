TITLE Introduccion

;DESCRPICIÓN
;Objetivo: OBTENER LA CANTIDAD DE NUMEROS QUE SON PARES 
;
; Autore(s):
; Mtro. Alejandro Garcia
; Alumo Luis Armando Hernandez Licea
;

; Semestre: 8vo Semestre ISC
;FIN DESCRIPCIÓN

INCLUDE Irvine32.inc
INCLUDE LibreriaMacros.inc


.data
; Área de Declaración de Variables
numerosP3 dword 11,40,3,55,15,4,23,12,32,12,31,21,18
.code
 main3 PROC
;Lógica del Programa

mov eax, sizeof numerosP3
mov ebx, 4	
mov edx, 0
div ebx
mov ecx, eax	;ecx = total del arreglo
;call writedec





mov ebx,0	;suma = 0
mov edi,0	;contador o indice

;contar pares
mov ebx,0
ciclo1:	
	mov eax, numerosP3[edi]
	salto:	;se resta de 2 en 2 hasta que el numero resultante sea menor a 2 
	sub eax, 2

	cmp eax, 2
	jg salto	

	cmp eax,1	;salta si es impar 
	jz salto2	
	inc ebx		
	salto2:
	
	add edi, 4
loop ciclo1

PrinLn  " Total de pares:"
mov eax, ebx
call writedec




exit
main3 ENDP
END main3

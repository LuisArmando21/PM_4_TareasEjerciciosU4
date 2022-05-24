TITLE Introduccion

;DESCRPICIÓN
;Objetivo: IMPRIMIR LA CANTIDAD DE NUMEROS MAYORES A X SIENDO X INGRESADO POR EL USUARIO 
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
numerosP4 dword 11,40,3,55,15,4,23,12,32,12,31,21,18
.code
 main4 PROC
;Lógica del Programa

mov eax, sizeof numerosP4
mov ebx, 4	
mov edx, 0
div ebx
mov ecx, eax	;ecx = total elementos del arreglo
;call writedec





mov ebx,0	;suma = 0
mov edi,0	;contador o indice

PrinLn  " Ingrese numero: "
call readint 
mov ebx, eax

;contar pares

ciclo1:	
	mov eax, numerosP4[edi]
	cmp eax, ebx 
	jl salto	;salta si es menor 

	call writedec 
	call crlf
	salto:


	
	add edi, 4
loop ciclo1





exit
main4 ENDP
END main4

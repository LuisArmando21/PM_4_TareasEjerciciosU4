TITLE Introduccion

;DESCRPICIÓN
;Objetivo: Calcular el determinante de una matriz 2x2
;
; Autore(s):
; Mtro. Alejandro Garcia
; Alumo 
;

; Semestre: 8vo Semestre ISC
;FIN DESCRIPCIÓN

INCLUDE Irvine32.inc
INCLUDE LibreriaMacros.inc

.data
; Área de Declaración de Variables
matriz_P12  dword  5,  9  
		    dword 6, 8  
		    
.code
 main12 PROC
;Lógica del Programa

mov esi, 4	;columnas
mov edi, 0	;filas
mov eax, matriz_P12[esi+edi]

mov esi, 0	;columnas
mov edi, 8	;filas
mul matriz_P12[esi+edi]

mov ebx, eax	;respaldo

mov esi, 0	;columnas
mov edi, 0	;filas
mov eax, matriz_P12[esi+edi]

mov esi, 8	
mov edi, 4	
mul matriz_P12[esi+edi]

sub eax, ebx
Print "El determiante es: "
call writeint

exit
main12 ENDP
END main12

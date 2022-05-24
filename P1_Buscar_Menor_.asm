TITLE Introduccion

;DESCRPICIÓN
;Objetivo: BUSCAR EL MENOR DE LA MATRIZ
;
; Autore(s):
; Mtro. Alejandro Garcia
; Alumo Luis Armando Hernandez Licea
;

; Semestre: 8vo Semestre ISC
;FIN DESCRIPCIÓN

INCLUDE Irvine32.inc

.data
; Área de Declaración de Variables
numerosP1 dword 11,7,6,13,20,80,24
.code
 main1 PROC
;Lógica del Programa
mov ecx, 6	;tamaño puesto directo
mov edi, 0
mov ebx, numerosP1[edi]
ciclo:
	add edi,4
	cmp ebx, numerosP1[edi]
	jl continuar 
	mov ebx, numerosP1[edi]
	continuar:
loop ciclo
mov eax, ebx
call writedec

exit
main1 ENDP
END main1

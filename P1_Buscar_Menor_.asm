TITLE Introduccion

;DESCRPICI�N
;Objetivo: BUSCAR EL MENOR DE LA MATRIZ
;
; Autore(s):
; Mtro. Alejandro Garcia
; Alumo Luis Armando Hernandez Licea
;

; Semestre: 8vo Semestre ISC
;FIN DESCRIPCI�N

INCLUDE Irvine32.inc

.data
; �rea de Declaraci�n de Variables
numerosP1 dword 11,7,6,13,20,80,24
.code
 main1 PROC
;L�gica del Programa
mov ecx, 6	;tama�o puesto directo
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

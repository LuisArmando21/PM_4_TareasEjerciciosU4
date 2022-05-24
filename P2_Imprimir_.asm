TITLE Introduccion

;DESCRPICIÓN
;Objetivo: ;BUSCAR E 
;IMPRIMIR TODOS LOS ELEMENTOS MAYORES O IGUALES AL PROMEDIO
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
numerosP2 dword 11,40,3,55,15,4,23,12,32,12,31,21,18

.code
 main2 PROC
;Lógica del Programa

;calcular tamaño arreglo
mov eax, sizeof numerosP2
;call writedec
call crlf 
mov ebx, 4	
mov edx, 0
div ebx
mov ecx, eax	;ecx = total del arreglo

;call writedec

push ecx	;respaldo ecx en la pila 

mov ebx,0	;suma = 0
mov edi,0	;contador o indice

call crlf

ciclo:
add ebx,numerosP2[edi]
add edi, 4	;debido a que cada valor del arreglo es de 4 bytes
loop ciclo
mov edx, 0
xchg eax, ebx
div ebx
call writedec
call crlf
call crlf

;se procede con la impresion de mayores o iguales al promedio
pop ecx	;se recupera tamaño arreglo
mov ebx, eax	;se respalda promedio en ebx
mov edi, 0
ciclo2:
cmp ebx, numerosP2[edi]
jg salto
mov eax, numerosP2[edi]
call writedec
call crlf
salto:
add edi, 4
loop ciclo2


exit
main2 ENDP
END main2

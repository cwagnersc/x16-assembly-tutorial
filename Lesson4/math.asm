.org $080D
.segment "STARTUP"
.segment "INIT"
.segment "ONCE"
.segment "CODE"

CHROUT = $FFD2

   jmp start

foo: .word $1234
bar: .word $5678
result: .word 0
start:
   lda foo
   clc
   adc bar
   sta result
   lda foo+1
   adc bar+1
   sta result+1
   jsr print_hex
   lda result
   jsr print_hex
   rts

print_hex:
   pha	   ; empurra o conteudo original de A para a pilha
   lsr
   lsr
   lsr
   lsr      ; A = A >> 4
   jsr print_hex_digit
   pla      ; puxa o conteudo original de A de volta da pilha
   and #$0F ; A = A & 0b00001111
   jsr print_hex_digit
   rts

print_hex_digit:
   cmp #$0A
   bpl @letter
   ora #$30    ; numeros PETSCII : 1=$31, 2=$32, etc.
   bra @print
@letter:
   clc
   adc #$37		; letras PETSCII : A=$41, B=$42, etc.
@print:
   jsr CHROUT
   rts

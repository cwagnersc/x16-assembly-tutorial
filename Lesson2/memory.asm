.org $080D
.segment "STARTUP"
.segment "INIT"
.segment "ONCE"
.segment "CODE"

ZP_PTR_1 = $30
ZP_PTR_2 = $32
ZP_DATA  = $34

   jmp start         ; absoluto

data:
.byte $01,$23,$45,$67,$89,$AB,$CD,$EF

results:
.byte 0,0,0

start:
   ; copia os três primeiros bytes de dados para ZP_DATA
   lda data          ; absoluto
   sta ZP_DATA       ; página zero
   ldx #1            ; imediato
   lda data,x        ; absoluto indexado com X
   sta ZP_DATA,x     ; página zero indexado com X
   txa               ; implícito (transfere X para A)
   tay               ; implícito (transfere A para Y)
   iny               ; implícito (incrementa Y)
   lda data,y        ; absoluto indexado com Y
   sta ZP_DATA,y     ; página zero indexado com Y

   ; aponta ZP_PTR_1 para o começo dos dados
   lda #<data        ; endereço imediato byte menos significativo
   sta ZP_PTR_1      ; página zero
   lda #>data        ; endereço imediato byte mais significativo
   sta ZP_PTR_1+1    ; página zero calculado

   ; aponta ZP_PTR_2 para o ponto central do dado
   lda #<(data+4)    ; endereço imediato calculado byte menos significativo
   sta ZP_PTR_2      ; página zero
   lda #>(data+4)    ; enderço imediato calculado byte mais significativo
   sta ZP_PTR_2+1    ; página zero calculado

   ; Copia dados para resultados via ponteiros ZP
   lda (ZP_PTR_1)    ; página zero indireto
   sta results       ; absoluto
   inx               ; implícito
   lda (ZP_PTR_1,x)  ; página zero indireto indexado
   sta results+1     ; absoluto calculado
   lda (ZP_PTR_1),y  ; página zero indireto indexado com Y
   sta results,y     ; absoluto indexado com Y

   jmp (lookup_ptr)  ; absoluto indireto

lookup_ptr:
.addr lookup

lookup:
   jmp (jmp_table,x) ; aboluto indexado indireto

jmp_table:
.addr start,return

return:
   rts

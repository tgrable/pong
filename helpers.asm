.importonce

.macro dely() {
    ldx #$00
loop:
    nop
    inx
    bne loop
}

.macro sprite_row(value) {
  .byte extract_byte(value, 2), extract_byte(value, 1), extract_byte(value, 0) 
}

.function extract_byte(value, byte_id) {
  .var bits = byte_id * 8
  .eval value = value >> bits
  .return value & 255
}
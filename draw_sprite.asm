.importonce

.macro draw_sprite(sprite, x, y, memLocation, color, offset, spriteIndex) {
    lda #sprite
    sta sprites.enabled_bits
    sta sprites.vertical_stretch_bits
    lda #color
    sta sprites.colors + spriteIndex

    lda #x
    sta sprites.postition + 0 + offset
    lda #y
    sta memLocation
    sta sprites.postition + 1 + offset
    
    lda #254
    sta sprites.pointers + spriteIndex
}

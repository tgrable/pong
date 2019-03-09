#import "game_field.asm"

*=$0801

        .byte    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00

*=$0900

.const VIC2 = $d000

.label kernal_chrout    = $ffd2
.label top_line         = $0400
.label bottom_line      = $07C1
.label top_character    = $0078
.label bottom_character = $0079

.namespace sprites {
    .label postition    = VIC2
    .label enabled_bits = VIC2 + 21
    .label colors = VIC2 + 39
    .label pointers = top_line + 1024 - 8
    .label vertical_stretch_bits = VIC2 + 23
}

main:
    jsr init_game_field

    :draw_score()

draw_sprite:
    lda #%00000001
    sta sprites.enabled_bits
    sta sprites.vertical_stretch_bits
    lda #$04
    sta sprites.colors

    .var x = 25
    .var y = 55

    lda #x
    sta sprites.postition + 0
    lda #y
    sta sprites.postition + 1

    lda #254
    sta sprites.pointers
    
game_loop:
    // :handle_joystick_input(joystick_port_1)
    // :draw_player()
    jmp game_loop

end:


.pc = 64*254
:sprite_row(%000000000000000000000000)
:sprite_row(%000000000000000000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000000000000000000)
:sprite_row(%000000000000000000000000)
// :sprite_row(%000011000000000111111000)
// :sprite_row(%011011000000000110000000)
// :sprite_row(%011111000000000111111000)
// :sprite_row(%011001100000000000011000)
// :sprite_row(%011001100000000111111000)
// :sprite_row(%011111100000000110011000)
// :sprite_row(%011111100000000110011000)
// :sprite_row(%011000000000000110011000)
// :sprite_row(%011111100000000111111000)
// :sprite_row(%000001100000000111111000)
// :sprite_row(%011111100000000110000000)
// :sprite_row(%011111100000000110000000)
// :sprite_row(%000110000000000111111000)
// :sprite_row(%000110000000000110001100)
// :sprite_row(%000110000000000110011000)
// :sprite_row(%000110000000000111100000)
// :sprite_row(%000110000000000110011000)
// :sprite_row(%011011000000000111111000)
// :sprite_row(%011011000000000110000000)
// :sprite_row(%011111000000000111111000)
// :sprite_row(%011011000000000111111000)


.macro sprite_row(value) {
  .byte extract_byte(value, 2), extract_byte(value, 1), extract_byte(value, 0) 
}

.function extract_byte(value, byte_id) {
  .var bits = byte_id * 8
  .eval value = value >> bits
  .return value & 255
}
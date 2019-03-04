.import source "game_field.asm"

*=$0801

        .byte    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00

*=$0900

.label kernal_chrout    = $ffd2
.label top_line         = $0400
.label bottom_line      = $07C1
.label top_character    = $0078
.label bottom_character = $0079

main:
    jsr init_game_field

init_game_field:
    lda #147
    jsr kernal_chrout

    ldx #$00            // set x to zero
    stx $d021           // background color
    stx $d020           // border color

    :draw_line(top_line, top_character)
    :draw_line(bottom_line, bottom_character)
    :split_screen()

game_loop:
    // :handle_joystick_input(joystick_port_1)
    // :draw_player()
    jmp game_loop

end:

.macro draw_line(start, character) {
    ldx #$00
    lda #$78 //character character is giving me the wrong char code  // #$20 is the spacebar Screen Code
draw_loop:
    sta start,x             // fill four areas with 256 spacebar characters
    cpx #39
    bne draw_loop           // did X turn to zero yet?
    inx
    jmp draw_loop
end_draw_loop:
}

.macro split_screen() {
    ldx #$00
    lda #$78
    sta $043c,x
    cpx #39
draw_loop:
    inx
    bne draw_loop
    sta $043c,x
    cpx #39
    jmp draw_loop
}
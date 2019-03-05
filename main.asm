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
    :draw_score()

game_loop:
    // :handle_joystick_input(joystick_port_1)
    // :draw_player()
    jmp game_loop

end:

.macro draw_line(start, character) {
    ldx #$00
    lda #$78            //character character is giving me the wrong char code  // #$20 is the spacebar Screen Code
draw_loop:
    sta start,x         // fill four areas with 256 spacebar characters
    cpx #39
    beq end_draw_loop       // did X turn to zero yet?
    inx
    jmp draw_loop
end_draw_loop:
}

.macro split_screen() {
    ldx #$00 
    ldy #$00               
    lda #$78
    sta $043B,x 
clear_screen:
    cpx #$28
    beq draw_dot                 
    inx
    iny
    beq end
    jmp clear_screen       
draw_dot:
    sta $043B,y
    sta $052B,y 
    sta $061B,y 
    sta $06E3,y 
    ldx #$00
    jmp clear_screen
end:
}

.macro draw_score() {
    ldx #$79
    stx 1119
    stx 1120
    stx 1121

    ldx #$75
    stx 1159
    stx 1199
    stx 1239

    ldx #$76
    stx 1161
    stx 1201
    stx 1241

    ldx #$78
    stx 1279
    stx 1280
    stx 1281

    ldx #$79
    stx 1125
    stx 1126
    stx 1127

    ldx #$75
    stx 1165
    stx 1205
    stx 1245

    ldx #$76
    stx 1167
    stx 1207
    stx 1247

    ldx #$78
    stx 1285
    stx 1286
    stx 1287

    // lda #$01
    // sta 55391
    // sta 55392
    // sta 55393


    // lda #$00
    // sta 1024
    // lda #$01
    // sta 55296
}
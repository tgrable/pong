.importonce

// init_game_field:
//     lda #147
//     jsr kernal_chrout

//     ldx #$00            // set x to zero
//     stx $d021           // background color
//     stx $d020           // border color
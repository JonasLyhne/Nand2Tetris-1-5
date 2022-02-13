// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)


// @i bliver sat til værdien R1
@R1
D=M
@i
M=D

// sætter @p til 0
@0
D=A
@p
M=D


(LOOP)
    // Hvis i er 0 slut loop
    @i
    D=M
    @END
    D;JLE

    D=D-1
    @i
    M=D

    @p
    D=M
    @0
    D=D+M
    @p
    M=D
    @LOOP
    0;JMP
(END)
@p
D=M
@2
M=D
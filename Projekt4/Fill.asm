// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(START)
// Set memory of @i to the Address of SCREEN (first address in the screen array.) 
@SCREEN
D=A
@i
M=D
(LightLoop)
@KBD
D=M
@DarkLoop
D;JGT
// Gets the current pixel address
@i
D=M
// Set pixel to dark
@pixel
A=D
M=0
// Iterate to next Pixel in the line
@i
MD=M+1
// Make sure @i dosen't get too big
@24575
D = A-D
@START
D;JLE
@LightLoop
0;JMP
(EndLightLoop)
(DarkLoop)
@KBD
D=M
@EndDarkLoop
D;JLE
// Gets the current pixel address
@i
D=M
// Set pixel to dark
@pixel
A=D
M=-1
// Iterate to next Pixel in the line
@i
MD=M+1
// Make sure @i dosen't get too big
@24575
D = A-D
@START
D;JLE
@DarkLoop
0;JMP
// @EndDarkLoop
(EndDarkLoop)
@START
0;JMP
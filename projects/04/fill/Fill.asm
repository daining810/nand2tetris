// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//// Replace this comment with your code.

// 监听键盘是否有按键按下, 如果有则将屏幕设置成黑色, 反之则恢复成白色.
// 监听键盘是否有按键按下
(LOOP)
@KBD
D=M

// if (KBD == 0) goto WHITE
@WHITE
D;JEQ

// 设置成黑色
(BLACK)
// j = 0
@j
M=0

// m = 1024 * 8 一个屏幕的大小
// 256 * 512 个像素点, 一个寄存器的长度是 16bit
// 寄存器的个数为: 256 *512 / 16 = 8 * 1024 = 8k
@8192
D=A
@m
M=D

(LOOPB)
@j
D=M
@m
D=D-M
@LOOP
D;JEQ

@SCREEN
D=A
@j
A=D+M
M=-1 // 按照内置的位数将二进制数值11...1设置到对应的寄存器中,本例子

@j
M=M+1

@LOOPB
0;JMP

// 设置成白色
(WHITE)
// i = 0
@i
M=0

// n = 8 * 1024 一个屏幕的大小
@8192
D=A
@n
M=D

(LOOPW)
@i
D=M

@n
D=D-M
@LOOP
D;JEQ

@SCREEN
D=A
@i
A=D+M
M=0

@i
M=M+1

@LOOPW
0;JMP
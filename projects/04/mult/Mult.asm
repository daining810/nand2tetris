// RAM[2] = RAM[0] * RAM[1] 
// RAM[2] 为乘积, 记作: mult 
// RAMA[1] 为乘数, 记作: multiplier
// 得: mult = RAM[0] * multiplier

// mult = 0
@mult
M=0

// if (RAM[0] == 0) goto SETR2
@R0
D=M

@SETR2
D;JEQ

// if (RAM[1] == 0) goto SETR2
@R1
D=M

@SETR2
D;JEQ

// multiplier = 0
@multiplier
M=0

(LOOP)
@multiplier
D=M

@R1
D=D-M

// if (multiplier-RAM[1]) == 0 goto SETR2
@SETR2
D;JEQ   

@R0
D=M

@mult
M=D+M

@multiplier
M=M+1

@LOOP
0;JMP

(SETR2)
@mult
D=M

@R2
M=D

(END)
@END
0;JMP
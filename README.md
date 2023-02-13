# Flex Bison Calculator
• Supports the following math functions :  


# CFG
The equivalent CFG for the grammer used in this project is as follows :
```

```

# Usage
First of all, please make sure that both Flex and Bison are installed.  
To use the calculator, clone the project. Open command prompt and ```cd``` to the directory. Then use the following commands. If there were warnings, ignore them.  
```
bison -d -y calc.y
flex calc.lex
gcc -c y.tab.h y.tab.c lex.yy.c
gcc y.tab.o lex.yy.o -o $@ -lm
```  
A Unix executable file named "-lm" will be generated. open the file and enjoy!

# Example
```
a=2
T_IDEN  T_EQL  T_INT  = 2.000000
a^3
T_IDEN  T_POW  T_INT  = 8.000000

23 + sin(sqrt(16))
T_INT  T_ADD  T_SIN  T_PRNL  T_SQRT  T_PRNL  T_INT  T_PRNR  T_PRNR  = 22.243198

100 + 2e2
T_INT  T_ADD  T_FLOAT  = 300.000000
```

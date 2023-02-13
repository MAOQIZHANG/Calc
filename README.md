# Flex Bison Calculator
• Supports the following math functions :  
Note that anything on the right is not supported in my program. I tried but not working. 

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
see test file

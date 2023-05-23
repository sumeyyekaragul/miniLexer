# miniLexer
A very simple scanner for a new programming language which is includes Turkish expressions.

$flex myscanner.l
$gcc lex.yy.c -o scanner -lfl
$./scanner <input-file> 
  or $./scanner

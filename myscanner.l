%{
#include <stdio.h>
#include <stdlib.h>
%}

RAKAM    [0-9]
ID       [a-z][a-z0-9]*
whitespaces [ \t\n\v\b\r\f\a]+
tam	 {RAKAM}+
onda 	 {RAKAM}+"."{RAKAM}*
tumce    \"([^\\\"]|\\.)*\"

%%

{tam}   		               			       			      { printf("tamsayi: %s (%d)\n", yytext, atoi(yytext)); }
				 
{onda}       						      			      { printf("ondalikli sayi: %s (%g)\n", yytext, atof(yytext)); }

"ise"|"yoksa"|"devir"|"islev"|"donus"|"bos"|"devam"|"pes"|"onda"|"tam"|"tumce"        { printf("keyword: %s\n", yytext); }

{ID}        									      { printf("identifier: %s\n", yytext); }

"+"|"-"|"*"|"/"|"%"|"!" 				      			      { printf("operator: %s\n", yytext); }

"=="|"!="|">="|"<="|">"|"<"|"&&"|"||"                         			      { printf("sart operatorleri: %s\n", yytext); }

",,"[^,]*",,"    							 	      { printf( "yorum satiri: %s\n", yytext); }

{whitespaces}	         			 				      { printf("bosluk/lar\n"); }

{tumce}						  				      { printf("string: %s\n", yytext); }

"_"						                		      { printf("%s: alt_tire\n",yytext); }

.           	 								      { printf("%s: tanimlanmamis\n", yytext); }

%%

int main(int argc,char **argv) {
	if (argc == 2)
            yyin = fopen(argv[1], "r");
	else
            yyin = stdin;
	
	yylex();

	return 0;
}

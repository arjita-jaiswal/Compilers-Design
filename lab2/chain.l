%{


%}

%%
"Reverse" {printf("Token : REVERSE; Lexeme : %s\n",yytext);}
[a-z]+ {printf("Token : STRING; Lexeme : %s\n",yytext);}
[#]|[(]|[)] {printf("Token and Lexeme : %s\n",yytext);}
"\n" {printf("Token and Lexeme : <newline>\n");}
[\t] {printf("Invalid \n");}
[ ] {}
. {printf("Error : Not matched \n");}


%%

int main()
{
	
	yylex();
	return 0;
	
}

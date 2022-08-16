/*  yacc  file for parser for simple cryptographic expressions.
    Srinibas Swain, IIIT Guwahati
    Created:  03 January 2020
 */

        /*   declarations   */


%{
#include <stdio.h>
#include <string.h>
int yylex(void);
void yyerror(char *);
int yydebug=0;   /*  set to 1 if using with yacc's debug/verbose flags   */
char *reverse(char *);
%}

%union {
    /*int iValue;*/
    char *str;
};

%token  <str>  STRING
%token  <str>  REVERSE
%type  <str>  start
%type  <str>  expr

%start  start



%%       /*   rules section   */


start    :    expr  '\n'        {  printf("%s\n", $1);   }
         |         /*  allow "empty" expression  */           {     }
         ;

expr     :    STRING           {  $$ = $1;   }
         |    expr '#' expr    {  $$ = strcat($1,$3);  }
         |    REVERSE '(' STRING  ')'     {  $$ = reverse($3);  }
         ;


%%      /*   programs   */




char *reverse(char *str1)
/*  Reverse the string  str1.
*/
{
int length, c;
   char *begin, *end, temp;
 
   length = strlen(str1);
   begin  = str1;
   end    = str1;
 
   for (c = 0; c < length - 1; c++)
      end++;
 
   for (c = 0; c < length/2; c++)
   {        
      temp   = *end;
      *end   = *begin;
      *begin = temp;
 
      begin++;
      end--;
   }
return str1;
 
}


int main(void) {
    yyparse();
    return 0;
}

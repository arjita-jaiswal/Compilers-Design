%{
#include<stdio.h> 
int c=0,k=0;
%}
%%
[}]|[{] c++;
int|char|bool|float|void|for|do|while|if|else|return|void|auto|break|case|const|continue|default|double|enum|extern|goto|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|volatile k++;
. {/**/;}
%%

main()
{
yyin=fopen("file.txt","r");
yylex();
printf("%d count braces\n",c);
printf("%d keywords\n",k);
}

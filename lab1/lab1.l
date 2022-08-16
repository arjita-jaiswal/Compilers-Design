%{ 
	/* assignment */
	
	int b_line =0;
	int comment =0;
	int brackets=0;
	int count= 0;
	

%}
%%

^[ \ta-zA-Z0-9]*.*(;) {count++; }
^[ \ta-zA-Z0-9]*.*(")") {count++; }
^[#include]+  {count++; }
\n[' '\t]*\n { b_line++;}
^["/*"]+.*("*/")  { comment++;}
. {/**/;}
%%
int main()
{
	yyin=fopen("file.txt","r");
	yylex();
	printf("No. of code line: %d\n",count);
	printf("No of blank lines: %d\n",b_line);
	printf("No of comments:  %d\n",comment);
	
}

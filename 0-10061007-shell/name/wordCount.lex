%{
int wordCount = 0;
%}
chars [A-Za-z]
words {chars}+
numbers ([0-9])+
delim [" "]
whitespace {delim}+
ends [\.]
symbol ^" "+[<>&]" "+$
%% 
{words} { wordCount++;/* printf("Here is a word!\n");*/ }
{whitespace} { /*printf("Here is a whitespace!\n");*/ }
{numbers} { /*printf("Here is a numbers!\n");*/ }
{ends} { return;}
{symbol} { printf("Here is a symbol!\n"); }
%%
void main()
{
while(1) {
yylex(); /* start the analysis*/
printf("No of words: %d\n", wordCount);
}
}
int yywrap()
{
return 1;
}

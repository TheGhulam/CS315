%{
  #include "y.tab.h"  
  #include <stdlib.h>
  #include <stdio.h>
  extern int yylval;
  static void yyerror(char *);
%}
%option yylineno

digit [0-9]
sign  [+-]
integer {sign}?{digit}+
integer_list  {integer}(,{integer})+ 
variable  [A-Za-z_]+[A-Za-z0-9_]*
array_index {variable}\[({integer}|{variable})\]
variable_list {variable}(,{variable})+
variable_list_with_refs [ \t]*(&)?{variable}([ \t]*,[ \t]*(&)?{variable})+
combined_list ([ \t]*{integer}|{variable}|{array_index})([ \t]*,[ \t]*({integer}|{variable}|{array_index}))*
params  [ \t]*({integer}|{variable}|{array_index}|{combined_list})?[ \t]*
%%
input { return INPUT_OP; }
display { return OUTPUT_OP; }
begin { return SCOPE_OPEN; }
end { return SCOPE_CLOSE; }
if { return IF; }
else { return ELSE; }
for { return FOR; }
while { return WHILE; }
return { return RETURN; }
const { return CONST; }
{integer} { return LITERAL; }
{variable} { return VARIABLE; }
\[{combined_list}\] { return ARRAY; }
\"[^\"\n]*\" { return STRING; }
\/\*[^*]*\*\/ { return COMMENT; }
{variable}\({params}\) { return CALL_OP; }
{variable}\(([ \t]*(&)?{variable}|{variable_list_with_refs}|[ \t]*)?\)[ \t]*:[ \t]*{variable} { return FUNC_SIG; }
{variable}\.{variable}\({params}\) { return ARRAY_METHOD; }
{array_index} { return INDEX_OP; }
:\= { return ASSIGN_OP; }
\+ { return ADD_OP; }
- { return SUBTRACT_OP; }
\* { return MULTI_OP; }
\/ { return DIV_OP; }
% { return MODULA_OP; }
\^ { return EXPONENT_OP; }
\( { return BRACKET_OPEN; }
\) { return BRACKET_CLOSE; }
\=\= { return EQUAL_OP; }
!\= { return UNEQUAL_OP; }
\> { return GREATER_OP; }
\< { return LESSER_OP; }
\>\= { return GREATER_EQUAL_OP; }
\<\= { return LESSER_EQUAL_OP; }
$\=\= { return UN_EQUAL_OP; }
$!\= { return UN_UNEQUAL_OP; }
$\> { return UN_GREATER_OP; }
$\< { return UN_LESSER_OP; }
$\>\= { return UN_GREATER_EQUAL_OP; }
$\<\= { return UN_LESSER_EQUAL_OP; }
\, { return COMMA_OP; }
\n ; /* skip newline */
\; { return SC; }
[ \t] ; /* skip whitespace */
. { yyerror("Unknown character"); }
%%
int yywrap() { return 1; }
static void yyerror (char * s) {
  fprintf(stderr, "%s\n", s);
}
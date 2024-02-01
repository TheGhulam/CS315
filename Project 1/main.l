%option main
%{
  #include <stdio.h>
  #define TOKEN_DELIMITER " "
  #define STMT_DELIMITER "\n"
%}
digit [0-9]
sign  [+-]
integer {sign}?{digit}+
integer_list  {integer}(,{integer})+ 
variable  [A-Za-z_]+[A-Za-z0-9_]*
variable_list {variable}(,{variable})+
combined_list ({integer}|{variable})(,({integer}|{variable}))*
params  ({integer}|{variable}|{combined_list})?
%%
input { printf("INPUT_OP%s", TOKEN_DELIMITER); }
display { printf("OUTPUT_OP%s", TOKEN_DELIMITER); }
begin { printf("SCOPE_OPEN%s", TOKEN_DELIMITER); }
end { printf("SCOPE_CLOSE%s", TOKEN_DELIMITER); }
if { printf("IF%s", TOKEN_DELIMITER); }
else { printf("ELSE%s", TOKEN_DELIMITER); }
for { printf("FOR%s", TOKEN_DELIMITER); }
while { printf("WHILE%s", TOKEN_DELIMITER); }
return { printf("RETURN%s", TOKEN_DELIMITER); }
{integer} { printf("CONST%s", TOKEN_DELIMITER); }
{variable} { printf("VARIABLE%s", TOKEN_DELIMITER); }
\[{combined_list}\] { printf("ARRAY%s", TOKEN_DELIMITER); }
\"[^\"\n]*\" { printf("STRING%s", TOKEN_DELIMITER); }
\/\*[^*]*\*\/ { printf("COMMENT%s", TOKEN_DELIMITER); }
{variable}\({params}\) { printf("CALL_OP%s", TOKEN_DELIMITER); }
{variable}\(({variable}|{variable_list})?\):{variable} { printf("FUNC_SIG%s", TOKEN_DELIMITER); }
{variable}\.{variable}\({params}\) { printf("ARRAY_METHOD%s", TOKEN_DELIMITER); }
{variable}\[({integer}|{variable})\] { printf("INDEX_OP%s", TOKEN_DELIMITER); }
:\= { printf("ASSIGN_OP%s", TOKEN_DELIMITER); }
\+ { printf("ADD_OP%s", TOKEN_DELIMITER); }
- { printf("SUBTRACT_OP%s", TOKEN_DELIMITER); }
\* { printf("MULTI_OP%s", TOKEN_DELIMITER); }
\/ { printf("DIV_OP%s", TOKEN_DELIMITER); }
% { printf("MODULA_OP%s", TOKEN_DELIMITER); }
\^ { printf("EXPONENT_OP%s", TOKEN_DELIMITER); }
\( { printf("BRACKET_OPEN%s", TOKEN_DELIMITER); }
\) { printf("BRACKET_CLOSE%s", TOKEN_DELIMITER); }
\=\= { printf("EQUAL_OP%s", TOKEN_DELIMITER); }
!\= { printf("UNEQUAL_OP%s", TOKEN_DELIMITER); }
\> { printf("GREATER_OP%s", TOKEN_DELIMITER); }
\< { printf("LESSER_OP%s", TOKEN_DELIMITER); }
\>\= { printf("GREATER_EQUAL_OP%s", TOKEN_DELIMITER); }
\<\= { printf("LESSER_EQUAL_OP%s", TOKEN_DELIMITER); }
$\=\= { printf("UN_EQUAL_OP%s", TOKEN_DELIMITER); }
$!\= { printf("UN_UNEQUAL_OP%s", TOKEN_DELIMITER); }
$\> { printf("UN_GREATER_OP%s", TOKEN_DELIMITER); }
$\< { printf("UN_LESSER_OP%s", TOKEN_DELIMITER); }
$\>\= { printf("UN_GREATER_EQUAL_OP%s", TOKEN_DELIMITER); }
$\<\= { printf("UN_LESSER_EQUAL_OP%s", TOKEN_DELIMITER); }
\, { printf("COMMA_OP%s", TOKEN_DELIMITER); }
\n { printf("STMT_END%s%s", TOKEN_DELIMITER, STMT_DELIMITER); }
\t { printf("\t%s", TOKEN_DELIMITER); }
<<EOF>> { printf("%sPROGRAM_END%s", STMT_DELIMITER, STMT_DELIMITER); return 0; }
. {/* no action */}
%%
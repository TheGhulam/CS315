%{
  #include <stdio.h>
  int yylex(void);
  void yyerror(char *);

  extern int yylineno;
  // // line number under the RGM namespace
  // static int RGM_lineNumber = 1;
%}

%token INPUT_OP
%token OUTPUT_OP
%token SCOPE_OPEN
%token SCOPE_CLOSE
%token IF
%token ELSE
%token FOR
%token WHILE
%token RETURN
%token CONST
%token LITERAL
%token VARIABLE
%token ARRAY
%token STRING
%token COMMENT
%token CALL_OP
%token FUNC_SIG
%token ARRAY_METHOD
%token INDEX_OP
%token ASSIGN_OP
%token ADD_OP
%token SUBTRACT_OP
%token MULTI_OP
%token DIV_OP
%token MODULA_OP
%token EXPONENT_OP
%token BRACKET_OPEN
%token BRACKET_CLOSE
%token EQUAL_OP
%token UNEQUAL_OP
%token GREATER_OP
%token LESSER_OP
%token GREATER_EQUAL_OP
%token LESSER_EQUAL_OP
%token UN_EQUAL_OP
%token UN_UNEQUAL_OP
%token UN_GREATER_OP
%token UN_LESSER_OP
%token UN_GREATER_EQUAL_OP
%token UN_LESSER_EQUAL_OP
%token SPACE
%token COMMA_OP
%token STMT_END
%token PROGRAM_END
%token SC
%token UNKNOWN

%start program
%% 

program: subprogram
subprogram:
  subprogram func_def
  | subprogram stmt
  | empty;
empty:;

func_def: FUNC_SIG SCOPE_OPEN subprogram return_stmt SCOPE_CLOSE |
  FUNC_SIG SCOPE_OPEN subprogram return_stmt comment_stmt SCOPE_CLOSE;
return_stmt: RETURN expr SC;

stmt: simple_stmt | compound_stmt | comment_stmt;
comment_stmt: COMMENT;
compound_stmt: if_stmt | while_stmt | for_stmt;
simple_stmt: const_assign_stmt SC | assign_stmt SC | print_stmt SC | method_stmt SC;
const_assign_stmt: CONST assign_stmt;
assign_stmt: expr_assign | array_assign | input_assign;
print_stmt: OUTPUT_OP message;
message: STRING | expr | STRING COMMA_OP message | expr COMMA_OP message;
method_stmt: ARRAY_METHOD;

expr_assign: assignable expr;
array_assign: assignable ARRAY;
input_assign: assignable INPUT_OP STRING;
assignable: VARIABLE assign | INDEX_OP assign;
assign: ASSIGN_OP;

if_stmt: IF BRACKET_OPEN comparison_expr BRACKET_CLOSE SCOPE_OPEN subprogram SCOPE_CLOSE 
  | IF BRACKET_OPEN comparison_expr BRACKET_CLOSE SCOPE_OPEN subprogram SCOPE_CLOSE
    ELSE SCOPE_OPEN subprogram SCOPE_CLOSE;
   
while_stmt: WHILE BRACKET_OPEN comparison_expr BRACKET_CLOSE SCOPE_OPEN subprogram SCOPE_CLOSE
  | WHILE BRACKET_OPEN comparison_expr BRACKET_CLOSE SCOPE_OPEN subprogram SCOPE_CLOSE
    ELSE SCOPE_OPEN subprogram SCOPE_CLOSE;

for_stmt: FOR BRACKET_OPEN expr_assign COMMA_OP comparison_expr COMMA_OP expr_assign BRACKET_CLOSE SCOPE_OPEN subprogram SCOPE_CLOSE;

comparison_expr: expr signed_operator expr | expr unsigned_operator expr
signed_operator: EQUAL_OP | UNEQUAL_OP | GREATER_OP | LESSER_OP | GREATER_EQUAL_OP | LESSER_EQUAL_OP;
unsigned_operator: UN_EQUAL_OP | UN_UNEQUAL_OP | UN_GREATER_OP | UN_LESSER_OP | UN_GREATER_EQUAL_OP | UN_LESSER_EQUAL_OP;

expr: term | expr ADD_OP term | expr SUBTRACT_OP term;
term: base | term MULTI_OP base | term DIV_OP base | term MODULA_OP base;
base: exponent | base EXPONENT_OP exponent;
exponent: VARIABLE | LITERAL | CALL_OP | ARRAY_METHOD | INDEX_OP | BRACKET_OPEN expr BRACKET_CLOSE;

%% 

void yyerror (char *s) {
  fprintf(stderr, "line %d: %s\n", yylineno, s);
}

int main(void) {
  yyparse();
  return 0;
}
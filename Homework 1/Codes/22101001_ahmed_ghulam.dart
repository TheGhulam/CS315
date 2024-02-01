void main() {
  // Boolean operators
  print('Boolean Operators:');
  print('true && false: ${true && false}'); // AND
  print('true || false: ${true || false}'); // OR
  print('!true: ${!true}'); // NOT

  // Data types and Boolean values
  print('\nData Types and Boolean Values:');
  var truthyValue = 1; // Non-zero numbers are considered truthy in Dart
  var falsyValue = 0; // Zero is considered falsy
  print('1 (Truthy) && 0 (Falsy): ${truthyValue != 0 && falsyValue == 0}');
  print('null (Falsy): ${null}');

  // Operator precedence
  // The precedence of && over || is shown.
  print('\nOperator Precedence:');
  print('false || true && false: ${false || true && false}'); 
  // Equivalent to false || (true && false)

  // Associativity
  // Shows that && and || are left-associative.
  print('\nAssociativity:');
  print('true && false || true && true: ${true && false || true && true}'); 
  // Equivalent to ((true && false) || true) && true  
  
  // Evaluation order
  // Shows left-to-right evaluation, with the sideEffect() function not being called due to short-circuiting in logical expressions.
  print('\nEvaluation Order:');
  print('false && (sideEffect() || true): ${false && (sideEffect() || true)}'); 

  // Short-circuit evaluation
  // Shows how Dart does not evaluate the second operand if the first operand of && or || is sufficient to determine the result.
  print('\nShort-Circuit Evaluation:');
  print('true || (sideEffect() && false): ${true || (sideEffect() && false)}'); // sideEffect is not called due to short-circuit
}

bool sideEffect() {
  print('Side effect function called');
  return true;
}
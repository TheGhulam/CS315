def boolean_demo
    puts "Boolean Operators:"
    puts "true && false: #{true && false}" # AND
    puts "true || false: #{true || false}"         # OR
    puts "!true: #{!true}"                             # NOT
  
    # Data types and Boolean values
    puts "\nData Types and Boolean Values:"
    puts "1 (Truthy) && 0 (Falsy): #{1 && 0}" # In Ruby, 0 is truthy
    puts "'string' (Truthy) || '' (Falsy): #{'string' || ''}" # Non-empty string is truthy, empty string is also truthy
  
    # Operator precedence
    # Shows how && has higher precedence than ||.
    puts "\nOperator Precedence:"
    puts "false || true && false: #{false || true && false}" # Equivalent to false || (true && false)
  
    # Associativity
    # Shows that both && and || are left-associative.
    puts "\nAssociativity:"
    puts "true && false || true && true: #{true && false || true && true}" # Equivalent to ((true && false) || true) && true
  
    # Evaluation order
    # Shows left-to-right evaluation, with the side_effect() method not being called due to short-circuiting in logical expressions.
    puts "\nEvaluation Order:"
    puts "false && side_effect() || true: #{false && side_effect() || true}" # side_effect is not called due to short-circuit
  
    # Short-circuit evaluation
    # Shows how Ruby doesn't evaluate the second operand of && or || if the first operand is sufficient to determine the result.
    puts "\nShort-Circuit Evaluation:"
    puts "true || side_effect() && false: #{true || side_effect() && false}" # side_effect is not called due to short-circuit
  end
  
  def side_effect
    puts "Side effect function called"
    return true
  end
  
boolean_demo
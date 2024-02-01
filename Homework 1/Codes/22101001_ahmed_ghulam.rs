fn main() {
    println!("Boolean Operators:");
    println!("true && false: {}", true && false); // AND
    println!("true || false: {}", true || false);         // OR
    println!("!true: {}", !true);                             // NOT

    // Data types and Boolean values
    println!("\nData Types and Boolean Values:");
    // In Rust, only booleans are used in boolean expressions; other types need explicit conversion
    let truthy_value = 1; // Non-zero integers are not automatically considered truthy in Rust
    let falsy_value = 0;
    println!("Non-boolean values (1, 0): {}, {}", truthy_value, falsy_value);

    // Operator precedence
    // Shows how && has higher precedence than ||.
    println!("\nOperator Precedence:");
    println!("false || true && false: {}", false || true && false); // Equivalent to false || (true && false)

    // Associativity
    // Shows that both && and || are left-associative.
    println!("\nAssociativity:");
    println!("true && false || true && true: {}", true && false || true && true); // Equivalent to ((true && false) || true) && true

    // Evaluation order
    // Highlights left-to-right evaluation, with the side_effect() function not being called due to short-circuiting in logical expressions.
    println!("\nEvaluation Order:");
    println!("false && side_effect() || true: {}", false && side_effect() || true); // side_effect is not called due to short-circuit

    // Short-circuit evaluation
    // Shows Rust doesn't evaluate the second operand of && or || if the first operand is sufficient to determine the result.
    println!("\nShort-Circuit Evaluation:");
    println!("true || side_effect() && false: {}", true || side_effect() && false); // side_effect is not called due to short-circuit
}

fn side_effect() -> bool {
    println!("Side effect function called");
    true
}

package main

import (
	"fmt"
)

func main() {
	// Boolean operators
	fmt.Println("Boolean Operators:")
	fmt.Printf("true && false: %v\n", true && false) // AND
	fmt.Printf("true || false: %v\n", true || false)         // OR
	fmt.Printf("!true: %v\n", !true)                             // NOT

	// Data types and Boolean values
    // Non-boolean values are not implicitly converted to boolean.
	fmt.Println("\nData Types and Boolean Values:")
	var truthyValue int = 1 
    // In Go, only boolean values are considered in boolean expressions
	var falsyValue int = 0
	fmt.Printf("Non-boolean values (1, 0): %v, %v\n", truthyValue, falsyValue)

	// Operator precedence
    // It shows how && takes precedence over ||
	fmt.Println("\nOperator Precedence:")
	fmt.Printf("false || true && false: %v\n", false || true && false)   // Equivalent to false || (true && false)

	// Associativity
    // Shows that && and || are left-associative.
	fmt.Println("\nAssociativity:")
	fmt.Printf("true && false || true && true: %v\n", true && false || true && true) // Equivalent to ((true && false) || true) && true

	// Evaluation order
    // Shows left-to-right evaluation, with the sideEffect() function not being called due to short-circuiting in logical expressions.
	fmt.Println("\nEvaluation Order:")
	fmt.Printf("false && sideEffect() || true: %v\n", false && sideEffect() || true) // sideEffect is not called due to short-circuit

	// Short-circuit evaluation
    //  Shows how Go does not evaluate the second operand if the first operand of && or || is sufficient to determine the result.
	fmt.Println("\nShort-Circuit Evaluation:")
	fmt.Printf("true || sideEffect() && false: %v\n", true || sideEffect() && false) // sideEffect is not called due to short-circuit
}

func sideEffect() bool {
	fmt.Println("Side effect function called")
	return true
}
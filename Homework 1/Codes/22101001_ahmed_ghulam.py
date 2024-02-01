#! /usr/bin/env python

def boolean_demo():
    # Boolean operators
    print("Boolean Operators:")
    print("True and False:", True and False)
    print("True or False:", True or False)
    print("not True:", not True)

    # Data types and Boolean values
    # Shows How different types (integers, lists, dictionaries) behave in boolean contexts.
    print("\nData Types and Boolean Values:")
    print("1 (Truthy) and 0 (Falsy):", 1 and 0)
    print("[] (Falsy) or {} (Falsy):", [] or {})
    print("[1, 2, 3] (Truthy) or {} (Falsy):", [1, 2, 3] or {})

    # Operator precedence
    # Shows how and takes precedence over or.
    print("\nOperator Precedence:")
    print("False or True and False:", False or True and False)  # Equivalent to False or (True and False)

    # Associativity
    # Shows how operators of the same precedence are evaluated left to right.
    print("\nAssociativity:")
    print("False and False or True and True:", False and False or True and True)  # Equivalent to ((False and False) or True) and True

    # Evaluation order
    # Shows the left-to-right evaluation order, particularly in the context of short-circuiting.
    print("\nEvaluation Order:")
    print("False and (print('Hello') or True):", False and (print('Hello') or True))  # 'Hello' is not printed

    # Short-circuit evaluation
    # Shows how Python doesn't evaluate the second operand of and/or if the first operand is sufficient to determine the result.
    print("\nShort-Circuit Evaluation:")
    print("True or (print('World') and False):", True or (print('World') and False))  # 'World' is not printed

boolean_demo()
function booleanDemo()
    -- Boolean operators
    print("Boolean Operators:")
    print("true and false:", true and false) -- AND
    print("true or false:", true or false)      -- OR
    print("not true:", not true)                   -- NOT

    -- Data types and Boolean values
    -- This part demonstrates how Lua handles different values in boolean contexts.
    print("\nData Types and Boolean Values:")
    print("1 (Truthy) and 0 (Falsy):", 1 and 0) -- In Lua, all values except false and nil are truthy
    print("'string' (Truthy) or '' (Falsy):", 'string' or '') -- Strings are always truthy

    -- Operator precedence
    -- Shows how and takes precedence over or
    print("\nOperator Precedence:")
    print("false or true and false:", false or true and false) -- Equivalent to false or (true and false)

    -- Associativity
    -- Shows that and & or are left-associative.
    print("\nAssociativity:")
    print("true and false or true and true:", true and false or true and true) -- Equivalent to ((true and false) or true) and true

    -- Evaluation order
    -- Shows left-to-right evaluation, with the sideEffect() function not being called due to short-circuiting.
    print("\nEvaluation Order:")
    print("false and sideEffect() or true:", false and sideEffect() or true) -- sideEffect is not called due to short-circuit

    -- Short-circuit evaluation
    -- Shows how Lua does not evaluate the second operand of and or or if the first operand is sufficient to determine the result.

    print("\nShort-Circuit Evaluation:")
    print("true or sideEffect() and false:", true or sideEffect() and false) -- sideEffect is not called due to short-circuit
end

function sideEffect()
    print("Side effect function called")
    return true
end

booleanDemo()
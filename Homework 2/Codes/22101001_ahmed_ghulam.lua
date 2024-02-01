-- Demonstrating basic closure
function basicClosure()
    local message = "Hello"
    return function()
        print(message)
    end
end

-- Demonstrating closure with mutability
function mutableClosure()
    local counter = 5
    return function()
        counter = counter + 2
        print("Counter:", counter)
    end
end

-- Demonstrating closure that returns a function
function createAdder(addBy)
    return function(number)
        return number + addBy
    end
end

-- Demonstrating nested closures
function createMultiplier(multiplyBy)
    return function(number)
        local function innerFunction(innerNumber)
            return innerNumber * multiplyBy
        end
        return innerFunction(number)
    end
end

-- Demonstrating closure capturing multiple variables
function createComplexClosure(part1, part2)
    return function()
        print(part1, part2)
    end
end

-- Main function to run the closures
function main()
    local simpleClosure = basicClosure()
    simpleClosure() -- Output: Hello

    local counterClosure = mutableClosure()
    counterClosure() -- Output: Counter: 7
    counterClosure() -- Output: Counter: 9

    local adderClosure = createAdder(10)
    print(adderClosure(5)) -- Output: 15

    local nestedClosure = createMultiplier(4)
    print(nestedClosure(3)) -- Output: 12

    local complexClosure = createComplexClosure("Complex", "closure")
    complexClosure() -- Output: Complex closure
end

main()
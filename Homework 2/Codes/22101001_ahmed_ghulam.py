def basic_closure():
    message = "Hello"
    def closure():
        print(message)
    return closure

# Lambda version of the above function
basic_lambda_closure = lambda message="Hello": lambda: print(message)

def mutable_closure():
    counter = 3
    def closure():
        nonlocal counter
        counter += 4
        print("Counter:", counter)
    return closure

def create_adder(add_by):
    def adder(number):
        return number + add_by
    return adder

def create_multiplier(multiply_by):
    def multiplier(number):
        def inner_multiplier(inner_number):
            return inner_number * multiply_by
        return inner_multiplier(number)
    return multiplier

def create_complex_closure(part1, part2):
    def closure():
        print(part1, part2)
    return closure

# Lambda version of the above function
create_complex_closure_lambda = lambda part1, part2: lambda: print(part1, part2)

def create_counter_closure():
    count = 0
    def closure():
        nonlocal count
        count += 1
        return count
    return closure

def create_accumulator(initial_value):
    total = initial_value
    def accumulator(value):
        nonlocal total
        total += value
        return total
    return accumulator

def main():
    simple_closure = basic_closure()
    simple_closure() # Output: Hello

    simple_lambda_closure = basic_lambda_closure()
    simple_lambda_closure() # Output: Hello

    counter_closure = mutable_closure()
    counter_closure() # Output: Counter: 7
    counter_closure() # Output: Counter: 11

    adder_closure = create_adder(20)
    print(adder_closure(6)) # Output: 26

    multiplier_closure = create_multiplier(5)
    print(multiplier_closure(4)) # Output: 20

    complex_closure = create_complex_closure("Complex", "closure")
    complex_closure() # Output: Complex closure

    complex_closure_lambda = create_complex_closure_lambda("Complex", "closure")
    complex_closure_lambda() # Output: Complex closure

    count_closure = create_counter_closure()
    print(count_closure()) # Output: 1
    print(count_closure()) # Output: 2

    accumulator_closure = create_accumulator(50)
    print(accumulator_closure(5))  # Output: 55
    print(accumulator_closure(10)) # Output: 65

if __name__ == "__main__":
    main()
package main

import "fmt"

func main() {
    // Demonstrating basic closure
    message := "Hello"
    simpleClosure := func() {
        fmt.Println(message) // Captures 'message' from outer scope
    }
    simpleClosure() // Output: Hello

    // Demonstrating closure with mutability
    counter := 0
    incrementClosure := func() {
        counter++ // Mutates 'counter' variable
        fmt.Println("Counter:", counter)
    }
    incrementClosure() // Output: Counter: 1
    incrementClosure() // Output: Counter: 2

    // Demonstrating closure that returns a function
    adderClosure := createAdder(5)
    fmt.Println(adderClosure(3)) // Output: 8

    // Demonstrating nested closures
    nestedClosure := createMultiplier(2)
    fmt.Println(nestedClosure(5)) // Output: 10

    // Demonstrating closure capturing multiple variables
    complexClosure := createComplexClosure("Complex", "closure")
    complexClosure() // Output:  Complex closure
}

// Function that returns a closure adding a specific number
func createAdder(addBy int) func(int) int {
    return func(number int) int {
        return number + addBy
    }
}

// Function that returns a nested closure
func createMultiplier(multiplyBy int) func(int) int {
    return func(number int) int {
        return number * multiplyBy
    }
}

// Function that creates a closure capturing multiple variables
func createComplexClosure(part1 string, part2 string) func() {
    return func() {
        fmt.Println(part1, part2)
    }
}
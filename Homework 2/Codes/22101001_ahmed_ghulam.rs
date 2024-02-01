fn main() {
    // Basic closure
    let message = String::from("Hello");
    let basic_closure = || println!("{}", message);
    basic_closure(); // Output: Hello

    // Mutable closure
    let mut counter = 2;
    let mut mutable_closure = || {
        counter += 3; // Mutates counter
        println!("Counter: {}", counter);
    };
    mutable_closure(); // Output: Counter: 5
    mutable_closure(); // Output: Counter: 8

    // Closure returning a function
    let adder_closure = create_adder(10);
    println!("Result: {}", adder_closure(4)); // Output: Result: 14

    // Nested closures
    let multiplier_closure = create_multiplier(3);
    println!("Result: {}", multiplier_closure(6)); // Output: Result: 18

    // Closure capturing multiple variables
    let complex_closure = create_complex_closure("Complex", "closure");
    complex_closure(); // Output: Complex closure

    // Counter closure
    let mut counter_closure = create_counter_closure();
    println!("Count: {}", counter_closure()); // Output: Count: 1
    println!("Count: {}", counter_closure()); // Output: Count: 2

    // Accumulator closure
    let mut accumulator_closure = create_accumulator(30);
    println!("Total: {}", accumulator_closure(7)); // Output: Total: 37
    println!("Total: {}", accumulator_closure(8)); // Output: Total: 45
}

fn create_adder(add_by: i32) -> Box<dyn Fn(i32) -> i32> {
    Box::new(move |number| number + add_by)
}

fn create_multiplier(multiply_by: i32) -> Box<dyn Fn(i32) -> i32> {
    Box::new(move |number| number * multiply_by)
}

fn create_complex_closure<'a>(part1: &'a str, part2: &'a str) -> Box<dyn Fn() + 'a> {
    Box::new(move || println!("{} {}", part1, part2))
}

fn create_counter_closure() -> Box<dyn FnMut() -> i32> {
    let mut count = 0;
    Box::new(move || {
        count += 1;
        count
    })
}

fn create_accumulator(start: i32) -> Box<dyn FnMut(i32) -> i32> {
    let mut total = start;
    Box::new(move |value| {
        total += value;
        total
    })
}
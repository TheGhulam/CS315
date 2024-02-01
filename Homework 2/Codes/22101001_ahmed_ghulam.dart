void main() {
  // Demonstrating basic closure
  String message = 'Hello';
  var simpleClosure = () => print(message);
  simpleClosure(); // Output: Hello

  // Demonstrating closure with mutability
  int counter = 0;
  var incrementClosure = () {
    counter += 1;
    print('Counter: $counter');
  };
  incrementClosure(); // Output: Counter: 1
  incrementClosure(); // Output: Counter: 2

  // Demonstrating closure with a returned function
  var adderClosure = createAdder(5);
  print(adderClosure(3)); // Output: 8

  // Demonstrating nested closures
  var nestedClosure = createMultiplier(2);
  print(nestedClosure(5)); // Output: 10

  // Demonstrating closure capturing multiple variables
  var complexClosure = createComplexClosure('Complex', 'Closure');
  complexClosure(); // Output: Complex Closure 
}

// Function that returns a closure adding a specific number
Function(int) createAdder(int addBy) {
  return (int number) => number + addBy;
}

// Function that returns a nested closure
Function(int) createMultiplier(int multiplyBy) {
  return (int number) {
    int innerFunction(int innerNumber) {
      return innerNumber * multiplyBy;
    }
    return innerFunction(number);
  };
}

// Function that creates a closure capturing multiple variables
Function() createComplexClosure(String part1, String part2) {
  return () => print('$part1 $part2');
}
def basic_closure
    message = "Hello"
    Proc.new { puts message }
  end
  
  def mutable_closure
    counter = 1
    Proc.new do
      counter += 2
      puts "Counter: #{counter}"
    end
  end
  
  def create_adder(add_by)
    lambda { |number| number + add_by }
  end
  
  def create_multiplier(multiply_by)
    lambda do |number|
      inner_multiplier = lambda { |inner_number| inner_number * multiply_by }
      inner_multiplier.call(number)
    end
  end
  
  def create_complex_closure(part1, part2)
    Proc.new { puts "#{part1} #{part2}" }
  end
  
  def create_counter_closure
    count = 0
    Proc.new do
      count += 1
      count
    end
  end
  
  def create_accumulator(initial_value)
    total = initial_value
    lambda do |value|
      total += value
      total
    end
  end

  def main
    simple_closure = basic_closure
    simple_closure.call # Output: Hello
  
    counter_closure = mutable_closure
    counter_closure.call # Output: Counter: 3
    counter_closure.call # Output: Counter: 5
  
    adder_closure = create_adder(15)
    puts adder_closure.call(7) # Output: 22
  
    multiplier_closure = create_multiplier(6)
    puts multiplier_closure.call(3) # Output: 18
  
    complex_closure = create_complex_closure("Complex", "closure")
    complex_closure.call # Output:  Complex closure
  
    counter = create_counter_closure
    puts counter.call # Output: 1
    puts counter.call # Output: 2
  
    accumulator = create_accumulator(40)
    puts accumulator.call(5) # Output: 45
    puts accumulator.call(10) # Output: 55
  end
  
  main if __FILE__ == $PROGRAM_NAME
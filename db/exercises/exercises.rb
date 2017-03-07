def readFile(path)
  res = ""
  File.open(path, "r") do |f|
    f.each_line do |line|
      res += line
    end
  end
  return res
end

EXERCISES = [
  {
    title: "Hello World",
    description: "The classical introductory exercise. Just say \"Hello, World!\"",
    language_name: "Ruby",
    instruction: readFile("db/exercises/instructions/hello_world.txt"),
    test: readFile("db/tests/hello_world_test.rb"),
    initial_code: readFile("db/exercises/initial_code/hello_world.rb"),
    number_of_tests: 1
  },
  {
    title: "Hamming",
    description: "Calculate the Hamming difference between two DNA strands.",
    language_name: "Ruby",
    instruction: readFile("db/exercises/instructions/hamming.txt"),
    test: readFile("db/tests/hamming_test.rb"),
    initial_code: readFile("db/exercises/initial_code/hamming.rb"),
    number_of_tests: 5
  },
  {
    title: "Gigasecond",
    description: "Calculate the moment when someone has lived for 10^9 seconds.",
    language_name: "Ruby",
    instruction: readFile("db/exercises/instructions/gigasecond.txt"),
    test: readFile("db/tests/gigasecond_test.rb"),
    initial_code: readFile("db/exercises/initial_code/gigasecond.rb"),
    number_of_tests: 5
  },
  {
    title: "Raindrops",
    description: "Convert a number to a string, the contents of which depend on the number's factors.",
    language_name: "Ruby",
    instruction: readFile("db/exercises/instructions/raindrops.txt"),
    test: readFile("db/tests/raindrops_test.rb"),
    initial_code: readFile("db/exercises/initial_code/raindrops.rb"),
    number_of_tests: 5
  },
  {
    title: "Difference of Squares",
    description: "Find the difference between the sum of the squares and the square of the sum of the first N natural numbers.",
    language_name: "Ruby",
    instruction: readFile("db/exercises/instructions/difference_of_squares.txt"),
    test: readFile("db/tests/difference_of_squares_test.rb"),
    initial_code: readFile("db/exercises/initial_code/difference_of_squares.rb"),
    number_of_tests: 5
  },
  {
    title: "Pangram",
    description: "Determine if a sentence is a pangram.",
    language_name: "Ruby",
    instruction: readFile("db/exercises/instructions/pangram.txt"),
    test: readFile("db/tests/pangram_test.rb"),
    initial_code: readFile("db/exercises/initial_code/pangram.rb"),
    number_of_tests: 5
  },
  {
    title: "Sieve",
    description: "Use the Sieve of Eratosthenes to find all the primes from 2 up to a given number.",
    language_name: "Ruby",
    instruction: readFile("db/exercises/instructions/sieve.txt"),
    test: readFile("db/tests/sieve_test.rb"),
    initial_code: readFile("db/exercises/initial_code/sieve.rb"),
    number_of_tests: 5
  },
  {
    title: "Roman Numerals",
    description: "Write a function to convert from normal numbers to Roman Numerals.",
    language_name: "Ruby",
    instruction: readFile("db/exercises/instructions/roman_numerals.txt"),
    test: readFile("db/tests/roman_numerals_test.rb"),
    initial_code: readFile("db/exercises/initial_code/roman_numerals.rb"),
    number_of_tests: 5
  },
  {
    title: "Nth prime",
    description: "Given a number n, determine what the nth prime is.",
    language_name: "Ruby",
    instruction: readFile("db/exercises/instructions/nth_prime.txt"),
    test: readFile("db/tests/nth_prime_test.rb"),
    initial_code: readFile("db/exercises/initial_code/nth_prime.rb"),
    number_of_tests: 4
  },
  {
    title: "Grains",
    description: "Calculate the number of grains of wheat on a chessboard given that the number on each square doubles.",
    language_name: "Ruby",
    instruction: readFile("db/exercises/instructions/grains.txt"),
    test: readFile("db/tests/grains_test.rb"),
    initial_code: readFile("db/exercises/initial_code/grains.rb"),
    number_of_tests: 4
  }
]

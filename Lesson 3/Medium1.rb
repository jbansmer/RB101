def prompt(message)
  puts "=> #{message}"
end

prompt "Question 1:"
# print "The Flintstones Rock!" 10 times, each line indented one more space than the previous:
10.times {|i| puts (" " * i) + "The Flinstones Rock!"}

prompt "Question 2:"
# Why does the following code result in an error:
# puts "the value of 40 + 2 is " + (40 + 2)
# An integer cannot be concatenated with a string. Interpolation must be used:
puts "the value of 40 + 2 is #{40 + 2}"
# additional way of fixing it:
puts "the value of 40 + 2 is " + (40 + 2).to_s

prompt "Question 3:"
def factors(number)
  divisor = number
  factors = []
  for numbers in (1..number)
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(10)
p factors(0)
p factors(-10)

# The "if number % divisor == 0" statement weeds out unevenly divisable numbers
# the last line, calling the variable factors, ensures the method returns the array of calculated numbers

prompt "Question 4:"
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element #mutating of the original object
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element] #non-mutating, still returns the new object
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

prompt "Question 5:"
# Fix the code so that it works:
# limit = 15

# def fib(first_num, second_num)
#   while first_num + second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end

# result = fib(0, 1)
# puts "result is #{result}"

limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

prompt "Question 6:"
# predict the output of the following code:
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
# 34 - the method will return a value of 50 but answer remains unchanged,
# so printing answer - 8 is unaffected by the method call or its return value

prompt "Question 7:"
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
# will calling the method alter the munsters hash?

# no, the method will iterate and return altered values, but the original hash values will be unmatated
mess_with_demographics(munsters)
puts munsters
# WRONG - the method points to the object_id (the actual munsters hash, not a separate hash)
# and any changed affect the hash outside of the method.

prompt "Question 8:"
# given the following method:
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
# what will this recursive method call print:
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
# "paper"

prompt "Question 9:"
# given the following two methods:
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
# what will be the return value of:
p bar(foo)
# "no" since the method foo returns "yes", the method bar evaluates param as false, returning "no"
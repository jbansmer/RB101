def prompt(message)
  puts "=> #{message}"
end

prompt "Question 1:"
# What will the following code output?
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
# The numbers 1, 2, 2, 3 are printed on separate lines because numbers.uniq does not mutate the original array

prompt "Question 2:"
# 1. what is != and where should you use it?
# inequality operator; used when you want to evaluate a statement as true when two things are not equal (in Ruby)
# 2. put ! before something, like !user_name
# falsifies the variable or value; 'not user_name'
# 3. put ! after something, like words.uniq!
# implies a mutating method, mutating mutable objects
# 4. put ? before something
# shorthand for if in a ternary statement
# 5. put ? after something
# implies a boolean response to a method
# 6. put !! before something, like !!user_name
# truthifies a variable

prompt "Question 3:"
# replace 'important' with 'urgent':
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important', 'urgent')
puts advice

prompt "Question 4:"
# how do the methods differ:
numbers = [1, 2, 3, 4, 5]
p numbers.delete_at(1)
# .delete_at will delete the value at the index given as the argument; here, '2'
numbers = [1, 2, 3, 4, 5]
p numbers.delete(1)
# .delete will delete the value given as the argument; here, '1'
# both methods return the deleted value and modify the original array

prompt "Question 5:"
# Programmatically determine if 42 lies between 10 and 100:
range = (10..100)
p range.include?(42)
# .cover? behaves exactly like .include? if the values are numeric

prompt "Question 6:"
# insert "Four score and" two different ways:
famous_words = "seven years ago..."
p famous_words.split(' ').unshift('Four score and').join(' ')
famous_words = "seven years ago..."
p famous_words.prepend('Four score and ')
# also:
famous_words = "seven years ago..."
p "Four score and " << famous_words
famous_words = "seven years ago..."
p "Four score and " + famous_words

prompt "Question 7:"
# un-net the array:
flintstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
flintstones.flatten!
p flintstones

prompt "Question 8:"
# create an array consisting of Barney's name and number
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p flintstones.rassoc(2)
# .rassoc functions by finding either a key or value that is equal to the given argument and returning that key/value pair
# .assoc functions by finding a key that is equal to the given argument and return that key and its value
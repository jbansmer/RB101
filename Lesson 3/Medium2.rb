def prompt(message)
  puts "=> "
end

prompt "Question 1:"
# predict the following output:
a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id
# the first and third line will print the same ID, while the middle line will print a different ID
# identical strings point to different space in memory, so they will have different IDs

prompt "Question 2:"
# predict the following output:

a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id
# all will print the same ID; immutable objects that are identical will be the same object
# compare with mutable objects (strings) that create new (identical) objects with each
# variable instatiation

prompt "Question 3:"
# predict the following output:
def tricky_method(string_param_one, string_param_two)
  string_param_one += "rutabaga"
  string_param_two << "rutabaga"
end

string_arg_one = "pumpkins"
string_arg_two = "pumpkins"
tricky_method(string_arg_one, string_arg_two)

puts "String_arg_one looks like this now: #{string_arg_one}"
puts "String_arg_two looks like this now: #{string_arg_two}"
# Since the += combined operator does not mutate the string, the change to string_arg_one is scoped within the method
# and the first line will print 'pumpkins'. The shovel operator will mutate the string, so the second line
# will print 'pumpkinsrutabaga'.

prompt "Question 4:"
# predict the following output:
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
# my_string will be mutated to 'pumpkinsrutabaga' because the shovel operator modifies the orginal object without
# creating a new object within the method. The assingment operator creates a new object that array_param references.
# This new object is assigned the pumpkins/rutabaga array while the original object is left unmodified. When my_array
# is called, it still references the original object.

prompt "Question 5:"
# change the code below to not mutate any element, but to assign the string and array to pumpkin and rutabaga:
# def tricky_method(a_string_param, an_array_param)
#   a_string_param += "rutabaga"
#   an_array_param << "rutabaga"
# end

# my_string = "pumpkins"
# my_array = ["pumpkins"]
# tricky_method(my_string, my_array)

# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
# line 89 uses multiple string assingment

prompt "Question 6:"
# simplify the following method without changing its return value:
# def color_valid(color)
#   if color == "blue" || color == "green"
#     true
#   else
#     false
#   end
# end

def color_valid(color)
  color == "blue" || color == "green" ? true : false
end

p color_valid("blue")
p color_valid("green")
p color_valid("red")

# the '? true : false' component is not necessary
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

# predict the output of:

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# pumpkinsrutabaga
# ["pumpkins"]

# The first method mutates the caller since it does not create a new object. The array is a reassingment,
# which creates a new array within the scope of the method. 
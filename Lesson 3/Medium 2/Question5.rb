# def tricky_method(a_string_param, an_array_param)
#   a_string_param += "rutabaga"
#   an_array_param << "rutabaga"
# end

# my_string = "pumpkins"
# my_array = ["pumpkins"]
# tricky_method(my_string, my_array)

# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"

# change the code to not mutate anything but should output pumpkinsrutabaga and ['pumpkins', 'rutabaga'], respectively:

def tricky_method(a_string_param, an_array_param)
  string = a_string_param += "rutabaga"
  array = an_array_param += ["rutabaga"]
  return string, array
end

my_string = "pumpkins"
my_array = ["pumpkins"]

puts "My string looks like this now: #{tricky_method(my_string, my_array)[0]}"
puts "My array looks like this now: #{tricky_method(my_string, my_array)[1]}"

# check for non-mutation of original objects:
p my_string
p my_array
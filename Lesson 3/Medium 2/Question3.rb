def tricky_method(string_param_one, string_param_two)
  string_param_one += "rutabaga"
  string_param_two << "rutabaga"
end

string_arg_one = "pumpkins"
string_arg_two = "pumpkins"
tricky_method(string_arg_one, string_arg_two)

# predict the output of:

puts "String_arg_one looks like this now: #{string_arg_one}"
puts "String_arg_two looks like this now: #{string_arg_two}"

# pumpkins
# pumpkinsrutabga

# The first line in the method creates a new object, referenced by string_param_one, and concatenates
# rutabaga to the new object. This leaves the object referenced by string_arg_one unaffected, still
# pumpkins.
# The second line does not create a new object, so string_param_two references the same object as string_arg_two.
# When the concatenation occurs, it is reflected in string_arg_two because both that variable and string_param_two
# both reference the same object. The change escapes the method's scope because the String#<< method does not
# create a new object on which to operate.
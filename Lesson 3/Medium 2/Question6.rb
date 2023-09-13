# simplify the following code without changing the return value:

# def color_valid(color)
#   if color == "blue" || color == "green"
#     true
#   else
#     false
#   end
# end

def color_valid(color)
  color == "blue" || color == "green"
end

# the statement will be evaluated with or without an if statement. If color is either blue or green the return will be true
# because of a truthy evaluation of the OR statement. Any falsy evaluation will therefore return false.
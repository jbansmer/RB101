def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# The first method passes in an array which gets mutated by the concatenation. The buffer 
# element references the object passed to the method (an array) and the change is refelcted
# outside the element.
# The second method passes in an array which does not get mutated. The input_array element
# now references a new object.
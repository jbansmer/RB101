# Fix the code to allow a false return and disallow x>4>x numbers:

# def dot_separated_ip_address?(input_string)
#   dot_separated_words = input_string.split(".")
#   while dot_separated_words.size > 0 do
#     word = dot_separated_words.pop
#     break unless is_an_ip_number?(word)
#   end
#   return true
# end

def is_an_ip_number?(num)
  (0..255).include?(num.to_i)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  dot_separated_words.keep_if do |element|
    is_an_ip_number?(element)
  end
  dot_separated_words.size == 4 ? true : false
end

p dot_separated_ip_address?("11.233.3.40")
p dot_separated_ip_address?("1.2.3")
p dot_separated_ip_address?("1234")
p dot_separated_ip_address?("hello")
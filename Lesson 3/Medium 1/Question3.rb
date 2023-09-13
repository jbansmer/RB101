# change the code to function when 0 is inputted:

# def factors(number)
#   divisor = number
#   factors = []
#   begin
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end until divisor == 0
#   factors
# end

def factors(number)
  divisor = number
  factors = []
  for numbers in (1..number)
    factors << numbers / divisor if numbers % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(0)
p factors(15)
p factors(25)
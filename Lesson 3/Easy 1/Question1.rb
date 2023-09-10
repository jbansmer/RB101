# What will the following code output:

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# The numbers variable still points to the original array [1, 2, 2, 3] because #uniq did not
# permanently change (mutate) the object. Each element from the array will be printed on
# separate lines because puts() is called.
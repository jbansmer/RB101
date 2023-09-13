# What is the result of the last line of code:

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# { :a => "hi there" }
# The object that informal_greeting references is mutated, and since no new object is created by the #<<
# method, the hash is permanently changed. This can be seen in the puts informal_greeting method call,
# and again when the whole hash is printed by the last line.
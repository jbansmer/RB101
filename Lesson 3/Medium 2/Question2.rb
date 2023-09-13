# precict the output:

a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# All object_id's will be identical. Unlike strings (or any mutable object), integers (or any immutable object)
# that are identical are identical objects, i.e. they share the same object_id because references to them point
# to the same location in memory.
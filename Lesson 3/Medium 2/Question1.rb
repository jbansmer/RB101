# predict the output:

a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# Objects 'a' and 'c' will have the same object_id, while 'b' will have another object_id.
# Even identical strings are separate objects with separate object_id's.
# Show if the name dino appears in this string:
advice = "Few things in life are as important as house training your pet dinosaur."

p advice.include?('dino')

# #match? also works here
# neither are perfect solutions, as any substring 'dino' would be evaluated as true
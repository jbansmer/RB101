def prompt(message)
  puts "=> #{message}"
end

prompt "Question 1:"
# Show 3 methods to see if 'Spot' exists in this hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.include?('Spot')
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages['Spot']
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.select {|key, value| key == 'Spot'}

# better methods:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.key?('Spot')
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.member?('Spot')

prompt "Question 2:"
# for the following string:
munsters_description = "The Munsters are creepy in a good way."
# transform it into the following strings:
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "The munsters are creepy in a good way."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
p munsters_description.swapcase
p munsters_description.capitalize
p munsters_description.downcase
p munsters_description.upcase
# ! used to mutate the original string

prompt "Question 3:"
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
# add additional_ages to the ages hash
p ages.merge(additional_ages)

prompt "Question 4:"
# determine if the name dino exists in the following string:
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?('dino')
# as a word by itself:
p advice.split(' ').include?('dino')

prompt "Question 5:"
# show an easier way to write the following array:
p flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
p flinstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

prompt "Question 6:"
# add Dino to the following array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones << 'Dino'

prompt "Question 7:"
# add Dino and Hoppy to the flinstones array
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flinstones.push('Dino').push('Hoppy')

prompt "Question 8:"
# use .slice! to remove everything before the word house:
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice(0..38)
# use .index('house') to reference the index of the word house instead of 38
p advice.slice!(0..(advice.index('house')-1))

prompt "Question 9:"
# count the 't's in the following string:
statement = "The Flintstones Rock!"
p statement.count('t')

prompt "Question 10:"
# center the following string to fit a 40-character space:
title = "Flintstone Family Members"
spaces = 40 - title.length
p centered = (' ' * (spaces / 2)) + title + ' ' + (' ' * (spaces / 2))
p centered.length

# orrrrrr the easy way:
p title.center(40)
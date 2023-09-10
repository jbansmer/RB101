# Use three methods to determine if "Spot" is present in the hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.include?('Spot')
p ages.member?('Spot')
p ages.has_key?('Spot')
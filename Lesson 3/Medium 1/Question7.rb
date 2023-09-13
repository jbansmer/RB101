munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
  p demo_hash.object_id
end

# does the following method call mess up the hash data?
mess_with_demographics(munsters)
p munsters.object_id

# The munsters hash object_id is passed to the method, and in this instance the reference to demo_hash
# and munsters is the same object. When demo_hash is changed, munsters reflects that change because the
# object referenced is still the same -- demo_hash does not reference a new object (although it seems like
# it should). The added #object_id method calls demonstrate that demo_hash and munsters are the same object.
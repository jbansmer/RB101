def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

# what is the result of the following method(s) call?
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# 'paper'. The nested methods return paper and rock, respectively, which are used as arguments in another
# method call that returns paper, which is coupled with rock as arguments in the final method call,
# which returns paper.
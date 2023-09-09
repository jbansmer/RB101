require 'abbrev'
CHOICES = ["rock", "paper", "scissors", "lizard", "spock"]
VALID_CHOICES = ["rock", "paper", "scissors", "lizard", "spock"].abbrev

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  puts "\e[H\e[2J"
end

def get_user
  name = ''
  loop do
    prompt "What is your name?"
    name = gets.chomp.downcase.capitalize
    break unless name.empty? || name.start_with?(' ')
    prompt "That doens't seem like much of a name. Let's try again..."
  end
  name
end

def get_number_of_games
  games = 0
  prompt "Try and win a Best-Of style tournament!"
  prompt "Choose an odd number of games to play to:"
  loop do
    games = gets.chomp.to_i
    if games > 0 && games.odd?
      break
    elsif games > 0 && games.even?
      prompt "Think decisively! Choose an odd number of games:"
    else
      prompt "Invalid number of games. Let's try again..."
      prompt "Choose an odd number of games to play to:"
    end
  end
  games
end

def get_user_choice
  choice = ''
  loop do
    prompt "Choose #{CHOICES.join(', ')}:"
    user_entry = gets.chomp.downcase
    if VALID_CHOICES.include?(user_entry)
      choice = VALID_CHOICES[user_entry]
      break
    elsif user_entry.start_with?('s')
      prompt "Pro Tip: enter 'sc' for Scissors and 'sp' for Spock..."
    else
      prompt "I'm not sure about that move. Let's try again..."
    end
  end
  choice
end

def calc_games_to_win(games)
  (games / 2) + 1
end

clear_screen

prompt "Welcome to Rock, Paper, Scissors, Lizard, Spock!"

user = get_user

win = "#{user} wins, Computer loses!"
loss = "#{user} loses, Computer wins!"
tie = "It's a tie!"

results_by_choice = {
  "rock" => {
    "rock" => tie,
    "paper" => loss,
    "scissors" => win,
    "lizard" => win,
    "spock" => loss
  },
  "paper" => {
    "rock" => win,
    "paper" => tie,
    "scissors" => loss,
    "lizard" => loss,
    "spock" => win
  },
  "scissors" => {
    "rock" => loss,
    "paper" => win,
    "scissors" => tie,
    "lizard" => win,
    "spock" => loss
  },
  "lizard" => {
    "rock" => loss,
    "paper" => win,
    "scissors" => loss,
    "lizard" => tie,
    "spock" => win
  },
  "spock" => {
    "rock" => win,
    "paper" => loss,
    "scissors" => win,
    "lizard" => loss,
    "spock" => tie
  }
}

number_of_games = get_number_of_games
games_needed_to_win = calc_games_to_win(number_of_games)

clear_screen
prompt "Alright, #{user}, get ready for the first of #{number_of_games} games..."
sleep 2
clear_screen

wins_user = 0
wins_computer = 0
game_number = 0
loop do
  prompt "The first to win #{games_needed_to_win} games will be the winner!"
  user_choice = get_user_choice
  computer_choice = CHOICES.sample

  if results_by_choice[user_choice][computer_choice] == win
    wins_user += 1
  elsif results_by_choice[user_choice][computer_choice] == loss
    wins_computer += 1
  end

  prompt "#{user} chooses #{user_choice}."
  prompt "Computer chooses #{computer_choice}."
  prompt results_by_choice[user_choice][computer_choice]

  sleep 3
  clear_screen
  prompt "The first to win #{games_needed_to_win} games will be the winner!"

  game_number += 1
  if game_number == 1
    prompt "After #{game_number} game, the score is:"
  else
    prompt "After #{game_number} games, the score is:"
  end
  prompt "#{user} - #{wins_user}, Computer - #{wins_computer}"

  break if games_needed_to_win == wins_user ||
           games_needed_to_win == wins_computer
end

clear_screen

prompt "After #{game_number} games, the final score is:"
prompt "#{user} - #{wins_user}, Computer - #{wins_computer}"

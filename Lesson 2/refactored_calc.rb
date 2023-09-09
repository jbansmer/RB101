require "yaml"
MESSAGES = YAML.load_file("calculator_messages.yml")
BULLET = "=> "
# LANGUAGE constant initialized after method list vis user prompt (lines 83-99)

# used for YAML messages with no string interpolation
def prompt(message)
  lang = LANGUAGE
  yaml_message = MESSAGES[lang][message]
  puts "=> #{yaml_message}"
end

# used for YAML messages with no leading bullet or appended newline
def print_no_bullet(message)
  lang = LANGUAGE
  yaml_message = MESSAGES[lang][message]
  print "#{yaml_message}"
end

# used for YAML messages with no leading bullet but with appended newline
def prompt_no_bullet(message)
  lang = LANGUAGE
  yaml_message = MESSAGES[lang][message]
  puts "#{yaml_message}"
end

# used for YAML messages surrounding an interpolated string
def greeting_prompt(first_message, interpolation, second_message)
  print "#{BULLET}"
  print_no_bullet(first_message)
  print "#{interpolation}"
  prompt_no_bullet(second_message)
end

# used for YAML message with additional nested level
# for the choice_prompt method below
def print_choice_messages(message)
  lang = LANGUAGE
  yaml_message = MESSAGES[lang][message]
  print "#{yaml_message}"
end

# used for a YAML messages followed by several interpolations
# special use case for outputting the operation chosen by user
# used for English, Spanish, French languages
def choice_prompt_en_es_fr(first_message, verb_operation, second_number, prep_operation, first_number)
  print "#{BULLET}"
  print_no_bullet(first_message)
  print_choice_messages(verb_operation)
  print "#{second_number} "
  print_choice_messages(prep_operation)
  puts "#{first_number}..."
end

# used exactly like the method above
# word order altered for German language
def choice_prompt_de(first_message, verb_operation, second_number, prep_operation, first_number)
  print "#{BULLET}"
  print_no_bullet(first_message)
  print "#{second_number} "
  print_choice_messages(prep_operation)
  print "#{first_number}"
  print_choice_messages(verb_operation)
  puts "..."
end

# used for a single YAML message with string interpolation
def goodbye_prompt(message, interpolation)
  print "#{BULLET}"
  print_no_bullet(message)
  puts "#{interpolation}!"
end

def valid_number?(number)
  if number == '0'
    true
  elsif number.to_f != 0.0
    true
  else
    false
  end
end

def divide_by_zero?(dividend)
  dividend.to_f.zero?
end

operations_by_language = {
  "en" => [ "add", "subtract", "multiply", "divide" ],
  "es" => [ "agregar", "restar", "multiplicar", "dividir" ],
  "de" => [ "add", "subtrahieren", "multiplizieren", "dividieren" ],
  "fr" => [ "add", "soustraire", "multiplier", "diviser" ]
}

another_options = {
  "en" => "y",
  "es" => "s",
  "de" => "j",
  "fr" => "o"
}

# determining user's preferred language, which initiates the constant LANGUAGE
loop do
  puts "#{MESSAGES["language"]["lang"]}"
  language_choice = gets.chomp
  case language_choice
  when '1'
    LANGUAGE = 'en'
    break
  when '2'
    LANGUAGE = 'es'
    break
  when '3'
    LANGUAGE = 'de'
    break
  when '4'
    LANGUAGE = 'fr'
    break
  else
    puts ("#{MESSAGES['lang']['language_error']}")
  end
end

prompt "welcome"

name = ''
loop do
  prompt "name?"
  name = gets.chomp.downcase
  if name.empty?
    prompt "name_error"
  else
    break
  end
end

greeting_prompt("hello", name.capitalize, "start")

loop do
  prompt "first?"
  first = gets.chomp

  loop do
    if valid_number?(first)
      break
    else
      prompt "number_error"
      first = gets.chomp
    end
  end

  prompt "second?"
  second = gets.chomp

  loop do
    if valid_number?(second)
      break
    else
      prompt "number_error"
      second = gets.chomp
    end
  end

  result = ''
  operation = ''
  loop do
    prompt "operation_prompt"
    operation = gets.chomp.downcase
    result =  case operation
              when "#{operations_by_language[LANGUAGE][0]}"
                first.to_f + second.to_f
              when "#{operations_by_language[LANGUAGE][1]}"
                first.to_f - second.to_f
              when "#{operations_by_language[LANGUAGE][2]}"
                first.to_f * second.to_f
              when "#{operations_by_language[LANGUAGE][3]}"
                first.to_f / second.to_f
              else
                "error"
              end
    if operation == "divide" && divide_by_zero?(second)
      prompt "zero_division_error"
    elsif result == "error"
      prompt "operation_error"
    else
      break
    end
  end

  if LANGUAGE == "de"
    choice_prompt_de("great", "#{operation}_verb", second, "#{operation}_prep", first)
  else
    choice_prompt_en_es_fr("great", "#{operation}_verb", second, "#{operation}_prep", first)
  end

  prompt "answer_is"
  print "#{BULLET}"
  puts result.to_s.gsub(/(\.)0+$/, '')

  prompt "another?"
  again = gets.chomp.downcase

  if again.start_with?(another_options[LANGUAGE])
    prompt "go_again"
  else
    break
  end
end

goodbye_prompt("goodbye", name.capitalize)

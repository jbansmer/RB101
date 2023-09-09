require "yaml"
MESSAGES = YAML.load_file("mortgage_messages.yml")
MONTHS_PER_YEAR = 12

def prompt(message)
  yaml_message = MESSAGES[message]
  puts "=> #{yaml_message}"
end

def prompt_no_newline(message)
  yaml_message = MESSAGES[message]
  print "=> #{yaml_message}"
end

def prompt_no_bullet(message)
  yaml_message = MESSAGES[message]
  print yaml_message
end

def prompt_no_yaml(message)
  print message
end

def years_to_months(years)
  years.to_f * MONTHS_PER_YEAR
end

def clear_screen
  "\e[H\e[2J"
end

def wait_for_it
  puts "calculating..."
  sleep 2
  clear_screen
end

def again?
  prompt "go_again?"
  gets.chomp.downcase.start_with? 'y'
end

def get_user_name
  user = ''
  loop do
    prompt "name?"
    user = gets.chomp.downcase.capitalize
    break unless user.empty? || user.start_with?(" ")
    prompt "name_error"
  end
  user
end

def get_principal
  principal = ''
  loop do
    prompt "borrow?"
    principal = gets.chomp.delete_prefix("$").delete(",").to_i
    break if principal > 0
    prompt "borrow_error"
  end
  principal
end

def get_interest_rate
  monthly_interest_rate = ''
  loop do
    prompt "interest?"
    yearly_interest_rate = gets.chomp.delete("%").to_f / 100
    monthly_interest_rate = yearly_interest_rate / MONTHS_PER_YEAR
    format('%.2f', yearly_interest_rate)
    prompt "wow" if (yearly_interest_rate * 100) == 0
    break if yearly_interest_rate >= 0
    prompt "interest_error"
  end
  monthly_interest_rate
end

def get_loan_term
  loan_in_months = ''
  loop do
    prompt "term?"
    loan_in_years = gets.chomp.to_f
    loan_in_months = years_to_months(loan_in_years)
    break if loan_in_years > 0
    prompt "term_error"
  end
  loan_in_months
end

def calc_monthly_payment(principal, interest, term)
  if interest == 0
    payment = principal / term
  else
    payment = principal * (interest / (1 - ((1 + interest)**(-term))))
  end
  payment.to_s
  monthly_payment = format('%.2f', payment)
  format_monthly_payment(monthly_payment)
end

def format_monthly_payment(monthly_payment)
  if monthly_payment.to_s.length > 9
    big_monthly_payment = monthly_payment.to_s.insert(-10, ',')
    big_monthly_payment.insert(-7, ',')
  elsif monthly_payment.to_s.length > 6
    monthly_payment.to_s.insert(-7, ',')
  else
    monthly_payment
  end
end

def format_principal(principal)
  if principal.to_s.length > 6
    big_principal = principal.to_s.insert(-6, ',')
    prompt_no_yaml big_principal.to_s.insert(-4, ',')
  elsif principal.to_s.length > 3
    prompt_no_yaml principal.to_s.insert(-4, ',')
  else
    prompt_no_yaml principal
  end
end

def monthly_payment_summary(monthly_payment)
  prompt_no_newline "monthly_payment"
  prompt_no_yaml monthly_payment.to_s
end

def principal_summary(principal)
  prompt_no_bullet "principal"
  format_principal(principal)
end

def interest_summary(interest)
  prompt_no_bullet "interest"
  prompt_no_yaml "#{((interest * MONTHS_PER_YEAR) * 100).to_s.gsub(/(\.)0+$/,
                                                                   '')}%"
end

def term_summary(term)
  prompt_no_bullet "term"
  yearly_term = term / MONTHS_PER_YEAR
  if yearly_term <= 1
    prompt_no_yaml "#{(yearly_term.round(2)).to_s.gsub(/(\.)0+$/,
                                                       '')} year.\n\n"
  else
    prompt_no_yaml "#{(yearly_term.round(2)).to_s.gsub(/(\.)0+$/,
                                                       '')} years.\n\n"
  end
end

def loan_summary(monthly_payment, principal, interest_rate, term)
  prompt "loan_summary"
  monthly_payment_summary(monthly_payment)
  principal_summary(principal)
  interest_summary(interest_rate)
  term_summary(term)
end

clear_screen

prompt "welcome"

user = get_user_name

sleep 0.5

prompt_no_newline "alright"
prompt_no_yaml user.to_s
prompt_no_bullet "get_started"

loop do
  principal = get_principal
  interest_rate = get_interest_rate
  loan_term = get_loan_term
  monthly_payment = calc_monthly_payment(principal,
                                         interest_rate, loan_term)
  wait_for_it
  loan_summary(monthly_payment, principal, interest_rate, loan_term)
  break unless again?
  clear_screen
  prompt "great_choice"
end

clear_screen

prompt_no_newline "thanks"
prompt_no_yaml "#{user}!\n\n"

sleep 3

clear_screen

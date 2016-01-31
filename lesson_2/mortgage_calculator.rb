# initialize three variables to start - Loan amount, APR, duration
# calculate loan duration in months and monthly interest rate
# interest rate should be expressed as .xx not x
# convert APR to monthly interest rate
def prompt(message)
  puts("=> #{message}")
end

loan_amount = ''
apr = ''
loan_duration_in_years = ''

operator_prompt = <<-MSG
  "Hi, welcome to mortgage calculator, 
  home of the mortgage calculator, 
  can I calculate your mortgage?"
MSG

loop do # main loop

  prompt("What is the amount of your loan?")
  loop do
    loan_amount = gets.chomp
    if loan_amount.empty?() || loan_amount.to_f() < 0
      prompt("I'm sorry, please enter a valid loan amount. Thanks!")
    else
      break
    end
  end 
  
  prompt("Alright, and how about the APR on that loan?")
    loop do
    apr = gets.chomp
    if apr.empty? || apr.to_f < 0
      prompt("I'm sorry, please enter a valid apr. Thanks!")
    else
      break
    end
  end 
  

  prompt("Great, finally what is the duration of this loan (in years)?")
    loop do
    loan_duration_in_years = gets.chomp
    if loan_duration_in_years.empty? || loan_duration_in_years.to_i < 0
      prompt("I'm sorry, please enter a valid number. Thanks!")
    else
      break
    end
  end 

  annual_interest_rate = apr.to_f/100
  monthly_interest_rate = annual_interest_rate/12
  months = loan_duration_in_years.to_i*12

  monthly_payment = loan_amount.to_f * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**-months.to_i))

  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")

  puts "Another calculation?"
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

puts "Thanks for using the mortgage calculator!"





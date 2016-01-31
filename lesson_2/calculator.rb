# ask the user for two numbers
# ask the user for an operatin to perform
# perform the operation on the two numbers
# output the results

def prompt(message)
  puts("=> #{message}")
end

first_number = ''
second_number = ''
operator = ''

def valid_number(number)
  number.to_i != 0
end

def operation_to_message(op)
  case  op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to the best calculator around. What's your name?")

name = ''

loop do
  name = gets.chomp

  if name.empty?
    puts("Please make sure to use your real name")
  else
    break
  end
end 

puts("Welcome, #{name}")


loop do #main loop

  loop do
  # prompt user for first number
    prompt("What is the first number you'd like to work with?")
    # get first number from user
    first_number = gets.chomp
    # check if number provided is valid number based on valid_number method defined above
    if valid_number(first_number)
      break 
    else
      prompt("Hmm, that doesn't look like a valid number, try again")
    end
  end

  loop do
  # prompt user for first number
    prompt("What is the second number you'd like to work with?")
    # get first number from user
    second_number = gets.chomp
    # check if number provided is valid number based on valid_number method defined above
    if valid_number(second_number)
      break 
    else
      prompt("Hmm, that doesn't look like a valid number, try again")
    end
  end

  # Makes the operator prompt multiline
  operator_prompt = <<-MSG
  Great, what mathematical operation would you like to perform?
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG

  # call operator prompt from above
  prompt(operator_prompt)

  loop do # operator loop
    # store operator from user
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Please enter a valid operation to perform on the function")
    end
  end # end operator loop

  puts "#{operation_to_message(operator)} these two numbers equals"

  # check operator to see what function to perform
  result = case operator
            when '1'
              first_number.to_i + second_number.to_i
            when '2'
              first_number.to_i - second_number.to_i
            when '3'
              first_number.to_i * second_number.to_i
            when '4'
              first_number.to_f / second_number.to_f
  end

  # print the result of the calculation
  puts "#{result}"

  # ask user if they would like to perform another calculation. If they say yes, the  main loop will repeat. If not, the calculator will quit
  prompt("Would you like to perform another calculation? (enter 'y' to go again.)")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")

end #end main loop

prompt("Thanks for using the calculator, #{name}!")

    
      
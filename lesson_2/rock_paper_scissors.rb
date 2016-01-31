VALID_CHOICES = %w(rock paper scissors)
user_score = ''
computer_score = ''

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') || 
  (first == 'paper' && second == 'rock') ||
  (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
      prompt("You won!")
  elsif win?(computer, player)
      prompt("You lost")
  else
      prompt("It's a tie")
  end
end

def keep_score

end

loop do #game loop
  choice = ''
  loop do 
    prompt("Choose rock, paper or scissors")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("Please choose rock, paper, or scissors")
    end
  end

  computer_choice = VALID_CHOICES.sample
  puts "Your choice: #{choice}. The computer's choice: #{computer_choice}"

  display_results(choice, computer_choice)

  prompt("Would you like to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end # end game loop

puts("Thanks for playing")
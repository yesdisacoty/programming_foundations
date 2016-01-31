require 'pry'

CARD_SUITS = ["H", "C", "D", "S"]
CARD_VALUES = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
MAX_VALUE = 21
DEALER_STAY = 17

def prompt(message)
  puts "=> #{message}"
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

# initialize the deck by combining the suits and the values (product) and shuffling the returned values (shuffle)
def build_deck
  CARD_SUITS.product(CARD_VALUES).shuffle
end

# extract values from cards and find the total of their values
def total(cards)
  values = cards.map { |card| card[1] } # this map method iterates through each card ([S, V]) and returns the value of the card from the second spot in the individual card array

  sum = 0 # initialize the sum variable that will be used to total the card values
  values.each do |value| # iterate through each value
    if value == "A" # if the card is an Ace, add 11 to the sum
      sum += 11
    elsif value.to_i == 0 # if the card's value is 0 when converted to an int, that means it is a face card and should be worth 10
      sum += 10
    else
      sum += value.to_i # otherwise, convert the value to an integer and add that to the sum
    end
  end

  # adjust aces if sum is greater than 21
  values.select { |value| value == "A" }.count.times do # iterate through the card values array, finding the aces.
    sum -= 10 if sum > MAX_VALUE # If the sum is greater than 21, subtract 10 from each ace, making the aces only worth 1
  end

  sum # return the sum
end # end total

def over?(cards)
  total(cards) > MAX_VALUE
end

def determine_winner(player_cards, dealer_cards)
  player_total = total(player_cards) # run the total function on the players cards
  dealer_total = total(dealer_cards) # run the total function on the dealer's cards

  if player_total > MAX_VALUE
    :player_busted
  elsif dealer_total > MAX_VALUE
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif player_total < dealer_total
    :dealer
  else
    :tie
  end
end # end determine_winner

def display_result(player_cards, dealer_cards)
  result = determine_winner(player_cards, dealer_cards) # run the determine_winner method on our current cards and store it as the result variable

  case result # take the return value from detemrine_winner and print a message to the screen based on which result it is
  when :player_busted
    prompt("You busted, the dealer won")
  when :dealer_busted
    prompt("The dealer busted, you won!")
  when :player
    prompt("You won!")
  when :dealer
    prompt("The dealer won :(")
  when :tie
    prompt("It's a tie")
  end
end # end display_results

loop do # main game loop
  prompt("Welcome to 21!")

  # init variables
  deck = build_deck
  player_cards = []
  dealer_cards = []

  # loop through the player card and dealer cards arrays two times and add a card from the deck each time.
  # Could this be refactored into a deal meathod?
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  prompt("Dealer has #{dealer_cards[0]} and ?")
  prompt("You have #{player_cards[0]} and #{player_cards[1]}")

  # player turn
  # can this be refactored into a method?
  loop do
    player_choice = nil # init player_turn variable
    loop do
      prompt("Would you like to hit or stay?")
      player_choice = gets.chomp
      break if player_choice == "hit" || player_choice == "stay"
      prompt("Please choose either 'hit' or 'stay'")
    end

    if player_choice == "hit"
      player_cards << deck.pop
      prompt("You chose to hit")
      prompt("Your cards are now #{player_cards}")
      prompt("Your total card value is now #{total(player_cards)}")
    end

    break if player_choice == "stay" || over?(player_cards)
  end

  if over?(player_cards)
    display_result(player_cards, dealer_cards)
    play_again? ? next : break
  else
    puts "You stayed at #{total(player_cards)}"
  end

  # dealer turn
  # can this be refactored into a method?
  puts "Dealer's turn"

  loop do
    break if over?(dealer_cards) || total(dealer_cards) >= DEALER_STAY

    puts "Dealer hits"
    dealer_cards << deck.pop
    puts "Dealer's cards are now #{dealer_cards}"
  end # end dealer turn

  if over?(dealer_cards)
    puts "The dealer now has #{total(dealer_cards)}"
    display_result(player_cards, dealer_cards)
    play_again? ? next : break
  else
    puts "Dealer stays at #{total(dealer_cards)}"
  end

  # both player and dealer stay - show cards

  puts "================="
  prompt("You have #{player_cards} for a total of #{total(player_cards)}")
  prompt("The dealer has #{dealer_cards} for a total of #{total(dealer_cards)}")
  puts "================="

  display_result(player_cards, dealer_cards)

  break unless play_again? # this play_again? is different than the others because it either resets or breaks the loop. The others have a "next step"
end

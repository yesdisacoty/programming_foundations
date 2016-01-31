# display the initial empty board
# prompt the user to mark a square
# The computer marks a square
# display updated state of the board
# if a winner occurred, display the winner
# if the board is full and no winner has emerged, declare a tie
# if neither winner nor full board, go to number two
# play again>?
# if yes, go to number 1
# if no, goodbye

require "pry"

# CONSTANTS
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'


# METHODS

def joinor(arr, delimiter, word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.join(delimiter)
end

def prompt(message)
  puts "=> #{message}"
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

# player chooses their square - in "prompt", we're referencing the empty_square method and joining each empty square to return an array to show the user their options
# Then we convert their choice to an int and check if the empty square array contains their choice. If so, we break the loop, if not we give them an error
# finally, we return the modified board with the PLAYER_MARKER constant in the space they selected by using our hash
def player_move!(brd)
  square = ''
  loop do 
    prompt("Choose a square (#{empty_squares(brd).join(', ')}):")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
      prompt("Sorry, that's not a valid move")
  end

  brd[square] = PLAYER_MARKER
end

# if two values of a line have a player_marker, find the third space by looking for the k/v pair with a value of ' '
def find_at_risk_square(line, board)
  if board.values_at(*line).count(COMPUTER_MARKER) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first 
  elsif board.values_at(*line).count(PLAYER_MARKER) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first    
  else
    nil
  end
end

def computer_move!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd)
    break if square
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def someone_won?(brd)
  detect_winner?(brd)
end

def detect_winner?(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3 # *line passes in all the values of the line array. Same as line[0], line[1], line[2]
       return 'You'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
       return 'Computer'
    end
  end
  nil
end

def board_is_full?(brd)
  empty_squares(brd).empty?
end


# def keep_score(brd)
#  player_score = 0
#  computer_score = 0
#
# detect_winner?(brd)
#  if 'You'
#    player_score ++ 1
#  elsif 'Computer'
#    computer_score ++ 1
#  else
#   nil
#  end
# 
#  puts "You: #{player_score} games. Computer: #{computer_score}" 
# end

def display_board(brd) # this method builds the board outline, and in the middle of each sqaure, passes in the key from the hash created in the init_board method
  system "clear"
  puts "You are #{PLAYER_MARKER}. The computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def init_board # this method inits a new board, looping through each square and giving it an empty value
  new_board = {}
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

# MAIN GAME LOOP
loop do

  board = init_board # store the init_board method as a variable to be passed around the program

  loop do

    display_board(board) # call the display_board method with a parameter of the initialized board

    player_move!(board)
    break if someone_won?(board) || board_is_full?(board)
    computer_move!(board)
    break if someone_won?(board) || board_is_full?(board)

  end

  display_board(board)

  if someone_won?(board)
    prompt("#{detect_winner?(board)} won the game!")
  else
    prompt("It's a tie!")
  end

 # keep_score(board)

  prompt("Play again? (Y or N)")
  answer = gets.chomp.downcase
  break unless answer.downcase.start_with?("y")
end
# END MAIN GAME LOOP

puts "Thanks for playing Tic Tac Toe!"




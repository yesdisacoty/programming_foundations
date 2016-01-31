score = {you: 0, computer: 0, tie: 0}
winner = ''

def detect_winner?(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3 
       winner = 'You'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
       winner = 'Computer'
     elsif empty_squares(brd).empty?
       winner = 'Tie' 
    end
  end
  nil
end

def keep_score(winner, score)
  if winner = 'You'
    score += 1
  elsif winner = 'Computer'
    computer_score += 1
  elsif empty_squares(board).empty?
    tie_score += 1
  end
end

# FINISH PROBLEM NUMBER SIX, REFACTORING METHODS
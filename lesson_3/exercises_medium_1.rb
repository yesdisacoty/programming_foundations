#1 indent string one more space with each line
  10.times { |number| puts (" " * number) + "The Flinstones Rock" }

#2 count how many times each letter appears in a string
  result = {} # init empty hash for results
  letters = ('A'..'Z').to_a + ('a'..'z').to_a # create arrays of all letters (upper and lower case)
  letters.each do |letter| # loop through letter arrays
    letter_frequency = statement.scan(letter).count # scan all letters in "letters" array and count howm any times they appear
    result[letter] = letter_frequency if letter_frequency > 0 
  end

#3
  This will not work because the int needs to be converted to a string

  one way to fix it is to call .to_s on the equation. The other is using string interpolation

#4 iterators act on the array itself, not a copy of it
  1)1 3
  2)1 2

#5
  def factor(number)
    dividend = number
    divisors = []

    while dividend > 0 do
      divisors << number / dividend if number % dividend == 0
      dividend -= 1
    end
  end 

#6 rolling buffer - pass in array, array max size, and new item. One array = array max size, add new item and drop first item
  rolling_buffer1 (<<) modifies the caller, while rolling_buffer2 (+[new_item]) does not modify the caller

#7
  limit is initiallized outside of the method, and then called from within the method. Instead, it should be passed into the method as an argument

#8 # Title Case A String
  string = "THIS IS a StrIng WitH A BUNCH OF WEIRD letters"
  string.split.map { |word| word.capitalize }.join(' ')

#9 # add age group to hash
  munsters.each do |name, details|
    case details['age']
      when 0...17
        details[age-group] = 'kid'
      when 18...64
        details[age-group] = 'adult'
      else
        details[age-group] = 'senior'  
    end
  end



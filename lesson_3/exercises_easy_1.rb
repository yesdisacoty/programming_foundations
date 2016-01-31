#1
  numbers = [1, 2, 2, 3]
  numbers.uniq

  puts numbers
#Answer
  1, 2, 2, 3

#2
  1) != translates o "does not equal" and should be used when working with control flow 
  2) !user_name means the boolean opposite of user_name
  3) ! after a method varies depending on the method 
  4) ? is the operator for if/else
  5) <method>? is part of the method name
  6) !! turns objects into their boolean equivalent

#3
  advice.gsub!('important', 'urgent')

#4
  delete_at deletes the item at that particular index
  delete deletes whatever argument is passed

#5
  (10..100).cover?(42)

#6) 
  famous_words.prepend("Four score and ")
  "Four score and " + famous_words

#7
  42

#8
  flinstones.flatten!

#9
  flinstone.assoc("Barney")

#10
  flinstone_hash = {}
  flinstones.each_with_index do |name, index|
    flinstone_hash[name] = index 
  end
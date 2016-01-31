#1 does ages hash include "Spot"
  ages.key?("Spot")
  ages.include?("Spot")
  ages.member?("Spot")

#2
  # ages.values creates an array of the hash objects
  ages.values.inject(:+)

#3 keep ages in hash if age < 100
  ages.keep_if?{|name, age| age < 100}

#4 mutilate string variable
  .capitalize!
  .swapcase!
  .downcase!
  .upcase!

#5 merge hashes
  ages.merge!(additional_ages)

#6 minuimum age in ages hash
  ages.values.min

#7 does string value contain "dino"
  advice.match?("Dino")

#8 find first name in array that starts with "Be"
  flinstones.index{ |name| name[0, 2] == "Be" }

#9 
  flinstones.map! do |name|
    name[0,3]
  end

#10
  flinstones.map! { |name| name[0, 3] }

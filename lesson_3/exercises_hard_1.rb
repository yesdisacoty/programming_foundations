#1
   The greeting would be nil. Variables initialized within an if statement are always nil

#2 What is output of the last line of this code?
  greetings = { a: 'hi' }
  informal_greeting = greetings[:a]
  informal_greeting << ' there'

  puts informal_greeting  #  => "hi there"
  puts greetings

  {a: "hi there"} #The << means that the original "greetings" variable was modified, and not a new object cloned from it. To do that, you could use + "there" instead of <<

#3
  #A one, two, three because of the = operator being used
  #B one, two, three because of the = operator being used
  #C two, three, one because of the gsub method

#4
  def make_uuid
    characters = []
    (0...9).each do { |digit| characters << digit.to_s }
    ('a'...'f').each do { |digit| characters << digit }

    uuid = ""
    sections = [8, 4, 4, 4, 12]
    sections.each_with_index.do |section, index|
      section.times { uuid += characters.random } # iterate through each place in the section, and assign it a random string from the characters array
      uuid += '-' unless index >= sections.size - 1 # once the section is complete, add a -, unless you're at section capacity -1
    end

    uuid
  end
  
#5
  def dot_separated_ip_address?(input_string)
    dot_separated_words = input_string.split(".")
    return false unless dot_separated_words.size == 4 # check that the number of sections is four

    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      return false unless is_a_number?(word)
    end

    true
  end



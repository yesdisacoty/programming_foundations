#1 look through hash and add ages of all males
  male_age = 0
  munsters.each do |name, details|
    male_age += details["age"] if details["gender"] == "male"
  end

#2
  munsters.each_pair do |name, details|
    puts "#{name} is #{details["age"]} years old and is a #{details["gendeer"]}"
  end

#3 refactored method
  def not_so_tricky_method(a_string_param, an_array_param)
    a_string_param += "rutabaga"
    an_array_param += ["rutabaga"]

    return a_string_param, an_array_param
  end

  my_string = "pumpkins"
  my_array = ["pumpkins"]
  my_string, my_array = not_so_tricky_method(my_string, my_array)

  puts "My string looks like this now: #{my_string}"
  puts "My array looks like this now: #{my_array}"

#4 reverse the words in a sentence
  sentence = "Humpty Dumpty sat on a wall."
  array = sentence.split(' ').reverse!
  new_sentence = array.join(' ')

#5
  34

#6
  The method is acting on the actual munsters hash so the data is messed with

#7 what is the output?
  def rps(fist1, fist2)
    if fist1 == "rock"
      (fist2 == "paper") ? "paper" : "rock"
    elsif fist1 == "paper"
      (fist2 == "scissors") ? "scissors" : "paper"
    else
      (fist2 == "rock") ? "rock" : "scissors"
    end
  end
  
  puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

  output = "paper"

#8 what does this return?
  def foo(param = "no")
  "yes"
  end

  def bar(param = "no")
    param == "no" ? "yes" : "no"
  end

  bar(foo)

  returns "no"


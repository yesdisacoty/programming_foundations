#3
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

  My string looks like this now: pumpkins # has to do with the += assignment operator, which reassigns the value of that string variable
  My array looks like this now: ["pumpkins", "rutabega"]

#4
  def tricky_method_two(a_string_param, an_array_param)
  a_string_param.gsub!('pumpkins', 'rutabaga')
  an_array_param = ['pumpkins', 'rutabaga']
  end

  my_string = "pumpkins"
  my_array = ["pumpkins"]
  tricky_method_two(my_string, my_array)

  puts "My string looks like this now: #{my_string}"
  puts "My array looks like this now: #{my_array}"

  My string looks like this now: rutabaga
  My array looks like this now: ["pumpkins"]

#5 
  def valid_color(color)
    color == "blue" ||  color == "green"
  end
require_relative 'near_earth_objects'
require_relative 'asteroid_info'

puts "________________________________________________________________________________________________________________________________"
puts "Welcome to NEO. Here you will find information about how many meteors, astroids, comets pass by the earth every day. \nEnter a date below to get a list of the objects that have passed by the earth on that day."
puts "Please enter a date in the following format YYYY-MM-DD."
print ">>"

date = gets.chomp

asteroid_info = AsteroidInfo.new(date)

puts "______________________________________________________________________________"
puts "On #{asteroid_info.formated_date}, there were #{asteroid_info.total_number_of_astroids} objects that almost collided with the earth."
puts "The largest of these was #{asteroid_info.largest_astroid} ft. in diameter."
puts "\nHere is a list of objects with details:"
puts asteroid_info.divider
puts asteroid_info.header
asteroid_info.create_rows(asteroid_info.astroid_list, asteroid_info.column_data)
puts asteroid_info.divider

require_relative 'near_earth_objects'
require_relative 'asteroid_info'

puts "________________________________________________________________________________________________________________________________"
puts "Welcome to NEO. Here you will find information about how many meteors, astroids, comets pass by the earth every day. \nEnter a date below to get a list of the objects that have passed by the earth on that day."
puts "Please enter a date in the following format YYYY-MM-DD."
print ">>"

@date = gets.chomp

# def astroid_details 
#   NearEarthObjects.find_neos_by_date(@date)
# end 

@asteroid_info = AsteroidInfo.new(@date)

# def astroid_list 
#   astroid_details[:astroid_list]
# end 

# def total_number_of_astroids 
#   astroid_details[:total_number_of_astroids]
# end 

# def largest_astroid 
#   astroid_details[:biggest_astroid]
# end 

# def column_labels 
#   { name: "Name", diameter: "Diameter", miss_distance: "Missed The Earth By:" }
# end 

# def column_data 
#   column_labels.each_with_object({}) do |(col, label), hash|
#     hash[col] = {
#       label: label,
#       width: [astroid_list.map { |astroid| astroid[col].size }.max, label.size].max
#     }
#   end
# end 

# def header 
#   "| #{ column_data.map { |_,col| col[:label].ljust(col[:width]) }.join(' | ') } |"
# end 

# def divider 
#   "+-#{column_data.map { |_,col| "-"*col[:width] }.join('-+-') }-+"
# end 

# def format_row_data(row_data, column_info)
#   row = row_data.keys.map { |key| row_data[key].ljust(column_info[key][:width]) }.join(' | ')
#   puts "| #{row} |"
# end

# def create_rows(astroid_data, column_info)
#   rows = astroid_data.each { |astroid| format_row_data(astroid, column_info) }
# end

def formated_date 
  DateTime.parse(@date).strftime("%A %b %d, %Y")
end 

puts "______________________________________________________________________________"
puts "On #{formated_date}, there were #{@asteroid_info.total_number_of_astroids} objects that almost collided with the earth."
puts "The largest of these was #{@asteroid_info.largest_astroid} ft. in diameter."
puts "\nHere is a list of objects with details:"
puts @asteroid_info.divider
puts @asteroid_info.header
@asteroid_info.create_rows(@asteroid_info.astroid_list, @asteroid_info.column_data)
puts @asteroid_info.divider

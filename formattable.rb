module Formattable
  def header 
    "| #{ column_data.map { |_,col| col[:label].ljust(col[:width]) }.join(' | ') } |"
  end 

  def divider 
    "+-#{column_data.map { |_,col| "-"*col[:width] }.join('-+-') }-+"
  end 

  def format_row_data(row_data, column_info)
    row = row_data.keys.map { |key| row_data[key].ljust(column_info[key][:width]) }.join(' | ')
    puts "| #{row} |"
  end

   def formated_date 
    DateTime.parse(@date).strftime("%A %b %d, %Y")
  end 
end
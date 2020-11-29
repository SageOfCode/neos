 require './formattable'
 
 class AsteroidInfo 
  include Formattable
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def astroid_details 
    NearEarthObjects.find_neos_by_date(@date)
  end 

  def astroid_list 
    astroid_details[:astroid_list]
  end 

  def total_number_of_astroids 
    astroid_details[:total_number_of_astroids]
  end 

  def largest_astroid 
    astroid_details[:biggest_astroid]
  end 

  def column_labels 
    { name: "Name", diameter: "Diameter", miss_distance: "Missed The Earth By:" }
  end 

  def column_data 
    column_labels.each_with_object({}) do |(col, label), hash|
      hash[col] = {
        label: label,
        width: [astroid_list.map { |astroid| astroid[col].size }.max, label.size].max
      }
    end
  end 

  def create_rows(astroid_data, column_info)
    rows = astroid_data.each { |astroid| format_row_data(astroid, column_info) }
  end
end 
require 'date'

class StudentRecord
  attr_reader :last_name
  attr_reader :first_name
  attr_reader :campus
  attr_reader :favorite_color
  attr_reader :date_of_birth

  def initialize(last_name, first_name, campus, date_of_birth,
                 favorite_color)
    @last_name = last_name
    @first_name = first_name
    @campus = campus
    @favorite_color = favorite_color
    if date_of_birth.include?('-')
      fmt = '%m-%d-%Y'
    elsif date_of_birth.include?('/')
      fmt = '%m/%d/%Y'
    end
    @date_of_birth = Date.strptime(date_of_birth, fmt)
  end

  def to_s
    [@last_name, @first_name, @campus,
     @date_of_birth.strftime("%-m/%-d/%Y"), @favorite_color].join(" ")
  end
end

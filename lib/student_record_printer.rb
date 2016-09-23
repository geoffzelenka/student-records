require File.expand_path(File.dirname(__FILE__) + '/student_record_sorter')

class StudentRecordPrinter
  def print(records)
    sorter = StudentRecordSorter.new
    puts "Output 1:"
    puts sorter.order_by_campus_then_last_name(records)
    puts
    puts "Output 2:"
    puts sorter.order_by_date_of_birth(records)
    puts
    puts "Output 3:"
    puts sorter.order_by_last_name(records)
  end
end

class StudentRecordSorter
  def order_by_campus_then_last_name(records)
    records.sort_by { |x| [x.campus, x.last_name] }
  end

  def order_by_date_of_birth(records)
    records.sort_by { |x| [x.date_of_birth] }
  end

  def order_by_last_name(records)
    records.sort_by { |x| [x.last_name] }.reverse
  end
end


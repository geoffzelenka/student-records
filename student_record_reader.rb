require File.expand_path(File.dirname(__FILE__) + '/student_record')


class StudentRecordReader

  COMMA_COLUMNS = {
    :first_name => 1,
    :last_name => 0,
    :campus => 2,
    :favorite_color => 3,
    :date_of_birth => 4
  } 
  PIPE_COLUMNS = {
    :first_name => 1,
    :last_name => 0,
    :middle_name => 2,
    :campus => 3,
    :favorite_color => 4,
    :date_of_birth => 5
  } 
  DOLLAR_COLUMNS = {
    :first_name => 1,
    :last_name => 0,
    :middle_name => 2,
    :campus => 3,
    :favorite_color => 5,
    :date_of_birth => 4
  }

  def initialize(filename, delim)
    if File.exists?(filename)
      @filename = filename
    else
      raise ReaderError.new("#{filename} does not exist")
    end
  
    if delim.size == 1 && delim[/,|\$|\|/]
      @delim = delim
    else
      raise ReaderError.new("#{delim} not supported, use ',' '$' or '|'")
    end
  end
  
  def read_file(fn=@filename, delim=@delim)
    data = Array.new
    File.open(fn).each do |line|
      data << line.strip.split(delim)
    end
    return data
  end

  def recordify(data = [], delim=@delim)
    if delim == ','
      fmt = COMMA_COLUMNS
    elsif delim == '$'
      fmt = DOLLAR_COLUMNS
    elsif delim == '|'
      fmt = PIPE_COLUMNS
    end

    records = []
  
    data.each do |d|
      reordered = [ d[fmt[:last_name]].strip,
                    d[fmt[:first_name]].strip,
                    d[fmt[:campus]].strip,
                    d[fmt[:date_of_birth]].strip,
                    d[fmt[:favorite_color]].strip
                  ]
      begin
        records << StudentRecord.new(*reordered)
      rescue ArgumentError => e
        puts "Bad date in record '#{d.join(" ")}' found, skipping..."
      end
    end
    return records
  end

  def get_records(fn=@filename, delim=@delim)
    data = read_file(fn, delim)
    return recordify(data, delim)
  end
end

class ReaderError < StandardError
end

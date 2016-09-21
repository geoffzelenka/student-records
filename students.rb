#!/usr/bin/env jruby

require File.expand_path(File.dirname(__FILE__) + '/student_record_reader')
require File.expand_path(File.dirname(__FILE__) + '/student_record_printer')

def main
  files = ['comma.txt']
  
  reader = StudentRecordReader.new(files[0],',')
  records = reader.get_records
  records += reader.get_records('dollar.txt','$')
  records += reader.get_records('pipe.txt','|')
  
  printer = StudentRecordPrinter.new

  printer.print(records)
end

if __FILE__ == $0
  main
end

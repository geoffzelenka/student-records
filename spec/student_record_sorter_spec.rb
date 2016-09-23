require 'java'
require 'Geoff.jar'
require 'student_record_sorter'

RSpec.describe StudentRecordSorter do
  before(:each) do
    java_import com.geoffzelenka.Student
    @a = Student.new('a','b','Atl','12-25-2000','blue')
    @z = Student.new('z','a','Atl','12-26-1999','brown')
    @b = Student.new('a','h','DC','10-1-2001','blue')
    @s = [@a, @z, @b] 

    @sorter = StudentRecordSorter.new
  end

  it "does not blow up on an empty list" do
    sorted = @sorter.order_by_last_name([])
    expect(sorted).to eql([])
  end

  it "sorts student records by date of birth in ascending order" do
    sorted = @sorter.order_by_date_of_birth(@s)
    expect(sorted).to eql([@z, @a, @b])
  end

  it "sorts student records by last name in descending order" do
    sorted = @sorter.order_by_last_name(@s)
    expect(sorted).to eql([@z, @b, @a])
  end

  it "sorts student records by campus and last name in descending order" do
    sorted = @sorter.order_by_campus_then_last_name(@s)
    expect(sorted).to eql([@a, @z, @b])
  end
end

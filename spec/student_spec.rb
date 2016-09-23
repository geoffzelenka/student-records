require 'java'
require 'Geoff.jar'
java_import com.geoffzelenka.Student

RSpec.describe Student do
  java_import java.util.Date

  describe "constructor" do
    before(:each) do 
      @args = ['a', 'b', 'bburg', '1/1/1', 'blue']
    end

    it 'parses MM-dd-yy correctly' do
      @args[4] = '08-25-81'
      s = Student.new(*@args)
      expect(s.getDateOfBirth == Date.new(1981,8,25))
    end
    it 'parses MM-dd-yyyy correctly' do
      @args[4] = '08-25-1981'
      s = Student.new(*@args)
      expect(s.getDateOfBirth == Date.new(1981,8,25))
    end
    it 'parses M-dd-yyyy correctly' do
      @args[4] = '8-25-1981'
      s = Student.new(*@args)
      expect(s.getDateOfBirth == Date.new(1981,8,25))
    end
    it 'parses MM/dd/yy correctly' do
      @args[4] = '08/25/81'
      s = Student.new(*@args)
      expect(s.getDateOfBirth == Date.new(1981,8,25))
    end
    it 'parses MM/dd/yyyy correctly' do
      @args[4] = '08/25/1981'
      s = Student.new(*@args)
      expect(s.getDateOfBirth == Date.new(1981,8,25))
    end
    it 'parses M/dd/yyyy correctly' do
      @args[4] = '8/25/1981'
      s = Student.new(*@args)
      expect(s.getDateOfBirth == Date.new(1981,8,25))
    end
    
    # java's SimpleDateFormat, will gladly parse to the end of a string
    # and so long as it did not poop the bed will gladly give you back 
    # a default value date
    #
    # unless you tell it to not be lenient. Actually that doesn't do a 
    # anything either.
    it 'Does not throw parse exception on bad dates cause java date.parse is dumb' do
      java_import java.text.ParseException
      @args[4] = 'notadate'
      #s = Student.new(*@args)
      #puts s.getDateOfBirth
      expect { Student.new(*@args) }.not_to raise_exception
    end

  end

  describe "toString" do
    before(:each) do 
      @args = ['a', 'b', 'bburg', '1/1/1', 'blue']
      @tostring = ['a', 'b', 'bburg', '1/1/1', 'blue']
    end

    it 'parses 01/05/2001 to 1/5/2001' do
      @args[4] = '01/05/2001'
      @tostring[4] = '1/5/2001'
      expect(Student.new(*@args).to_s == @tostring.join(" "))
    end
    it 'parses 01-05-2001 to 1/5/2001' do
      @args[4] = '01-05-2001'
      @tostring[4] = '1/5/2001'
      expect(Student.new(*@args).to_s == @tostring.join(" "))
    end
  end
  
end

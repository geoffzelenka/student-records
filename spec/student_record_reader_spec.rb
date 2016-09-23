require 'student_record_reader'

RSpec.describe StudentRecordReader do
  describe 'initialize' do
    it 'throws ReaderError if file does not exist' do
      expect { StudentRecordReader.new('/az/by/cx/g',',') }.
                to raise_exception(ReaderError, /exist/)
    end
    it 'throws ReaderError for unsupported delimeters' do
      expect(File).to receive(:exists?).with('mockfile').and_return(true)
      expect { StudentRecordReader.new('mockfile','A') }.
                to raise_exception(ReaderError, /supported/)
    end
  end

  describe 'recordify' do
    before(:each) do
      @student_string = ['last', 'first', '1/1/2001', 'color'].join(" ")
    end

    context 'with "|" delimiter' do
      let(:delim) { '|' }
      before(:each) do
        @data = [['last', 'first', 'middle', 'campus', 'color', '1/1/2001']]
      end
      it 'Reorders columns and makes students' do
        expect(File).to receive(:exists?).with('mockfile').and_return(true)
        a = StudentRecordReader.new('mockfile', delim)
        expect( a.recordify(@data, delim)[0].to_s == @student_string)
      end
    end
    context 'with "$" delimiter' do
      let(:delim) { '$' }
      before(:each) do
        @data = [['last', 'first','middle', 'campus', '1/1/2001', 'color']]
      end
      it 'Reorders columns and makes students' do
        expect(File).to receive(:exists?).with('mockfile').and_return(true)
        a = StudentRecordReader.new('mockfile', delim)
        expect( a.recordify(@data, delim)[0].to_s == @student_string)
      end
    end
    context 'with "," delimiter' do
      let(:delim) { ',' }
      before(:each) do
        @data = [['last', 'first', 'campus', 'color', '1/1/2001']]
      end
      it 'Reorders columns and makes students' do
        expect(File).to receive(:exists?).with('mockfile').and_return(true)
        a = StudentRecordReader.new('mockfile', delim)
        expect( a.recordify(@data, delim)[0].to_s == @student_string)
      end
    end
  end
end

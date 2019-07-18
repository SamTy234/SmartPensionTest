require 'database'

describe Database
  describe '#parse_file' do
    it "should be a multidimensional array" do
      expect(result.first).to be_a Array
      expect(result.last).to be_a Array
    end
  end

  describe '#populate_pages_array' do
    it "should return an array" do
      expect(result).to be_a Array
    end
  end

  describe '#populate_and_count_hash' do
    it "should return a hash" do
      expect(result).to be_a Hash
    end
  end

  describe '#count_page_visits' do
    it "should return a hash" do
      expect(result).to be_a Hash
    end
  end

end

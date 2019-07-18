require "database"

describe Database do
  let(:file_path) {"spec/webserver.log"}
  # db = Database.new(file_path)


  describe "#initialize" do
    it "should take the log file as its only argument" do
      expect(Database.instance_method(:initialize).arity).to eq(1)
    end
  end

  describe "#parse_file" do
    it "should be a multidimensional array" do
      expect(Database.new(file_path).parse_file.first).to be_a Array
      expect(Database.new(file_path).parse_file.last).to be_a Array
    end
  end

  describe "#populate_pages_array" do
    it "should return an array" do
      expect(Database.new(file_path).populate_pages_array).to be_a Array
    end
  end

  describe "#populate_and_count_hash" do
    it "should return a hash" do
      expect(Database.new(file_path).populate_and_count_hash).to be_a Hash
    end
  end

  describe "#count_page_visits" do
    it "should return a hash" do
      expect(Database.new(file_path).count_page_visits(
        Database.new(file_path).parse_file)).to be_a Hash
    end
  end
end

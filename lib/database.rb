require 'csv'

class Database
  def initialize(file_path)
    @file_path = file_path
  end

  # Takes in an array and returns a sorted array of the pages.
  def populate_pages_array
    pages = []
    parse_file.each {|page| pages << page[0]}
    pages.sort!
    if pages.empty? then raise("Error: Log file is empty") else return pages end
  end

  # Populates the hash with the pages as keys and ip addresses as an array of
  # values.
  def populate_and_count_hash
    data_hash = Hash.new()
    get_hash.each do |key, value|
      value.uniq!
      data_hash[key] = value.count
    end
    return data_hash.sort_by{|key, value| -value}.to_h
  end

  # Takes in array returned from populate_pages_array and returns a sorted hash
  # of the number of page visits.
  def count_page_visits
    data_hash = Hash.new(0)
    get_hash.each do |key, value|
      data_hash[key] = value.count
    end
    return data_hash.sort_by{|key, value| -value}.to_h
    # page_count = Hash.new(0)
    # pages.each_with_object(page_count){|page, new_hash| new_hash[page] += 1}
    # return page_count.sort_by{|key, value| -value}.to_h
  end

  def calculate_avg_visits
    data_hash = Hash.new()
    get_hash.each do |key, value|
      data_hash[key] = (value.count + value.uniq.count)/2
    end
    return data_hash.sort_by{|key, value| -value}.to_h
  end

  # private
  # Parses the log file into an array
  def parse_file
    pages_with_ip =[]
    CSV.foreach(@file_path){|row| pages_with_ip << row[0].split(' ')}
    return pages_with_ip
  end

  def get_hash
    data_hash = Hash.new(){|hsh, key| hsh[key] =[]}
    parse_file.each{|key, value| data_hash[key] << value}
    return data_hash
  end
end





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
    return pages
  end

  # Populates the hash with the pages as keys and ip addresses as an array of
  # values.
  def populate_and_count_hash
    data_hash = Hash.new(){|hsh, key| hsh[key] =[]}
    parse_file.each{|key, value| data_hash[key] << value}
    data_hash.each do |key, value|
      value.uniq!
      data_hash[key] = value.count
    end
    data_hash.sort_by
    return data_hash.sort_by{|key, value| -value}.to_h
  end

  # Takes in array returned from populate_pages_array and returns a sorted hash
  # of the number of page visits.
  def count_page_visits(pages)
    page_count = Hash.new(0)
    pages.each_with_object(page_count){|page, new_hash| new_hash[page] += 1}
    return page_count.sort_by{|key, value| -value}.to_h
  end

  # private
  # Parses the log file into an array
  def parse_file
    pages_with_ip =[]
    CSV.foreach(@file_path){|row| pages_with_ip << row[0].split(' ')}
    return pages_with_ip
  end
end





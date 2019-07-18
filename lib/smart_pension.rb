require 'csv'

class Database

  def initialize(file_path)
    @file_path = file_path
  end

  def parse_file
    pages_with_ip =[]

    CSV.foreach(@file_path) do |row|
      pages_with_ip << row[0].split(' ')
    end

    return pages_with_ip
  end

  def populate_pages_array(data)
    pages = []

    data.each do |page|
      pages << page[0]
    end

    pages.sort!
    return pages
  end

  def populate_hash(data)
    data_hash = Hash.new(){|hsh, key| hsh[key] =[]}

    data.each{|key, value| data_hash[key] << value}

    data_hash.each do |key, value|
      value.uniq!
      data_hash[key] = value.count
    end

    data_hash.sort_by

    return data_hash.sort_by{ |key, value| -value}.to_h
  end

  def count_page_visits(pages)

    page_count = Hash.new(0)

    pages.each_with_object(page_count) do |page, new_hash|
      new_hash[page] += 1
    end

    return page_count.sort_by{ |key, value| -value}.to_h
  end


end

d = Database.new('webserver.log')
p d.populate_hash(d.parse_file)
# p d.count_page_visits(d.handle_pages_array)



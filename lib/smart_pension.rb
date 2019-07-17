require 'csv'

class Database

  def initialize(file_path)
    @file_path = file_path
    @pages_with_ip = []
    @pages = []
  end

  def handle_pages_array
    CSV.foreach(@file_path) do |row|
      @pages_with_ip << row[0].split(' ')
    end

    @pages_with_ip.each do |page|
        @pages << page[0]
    end

    @pages.sort!
    return @pages
  end

  def page_count(pages)

    @pages.each_cons(2) do |current_page, next_page|
      first_page
    end

  end


end

d = Database.new('webserver.log')
d.page_count(d.handle_pages_array)



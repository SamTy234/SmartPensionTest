require_relative 'database'

def display_results(results)
  puts "In terms of total visits:"
  results.each {|key, value| puts "#{key} had #{value} visits in total"}
end

def display_unique_results(results)
  puts "-------------------------"
  puts "In terms of unique visits:"
  results.each {|key, value| puts "#{key} had #{value} unique visits"}
end

d = Database.new('webserver.log')
page_visits = d.count_page_visits(d.populate_pages_array(d.parse_file))
unique_page_visits = d.populate_hash(d.parse_file)

display_results(page_visits)
display_unique_results(unique_page_visits)


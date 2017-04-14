require 'open-uri'
require 'json'
require 'pry'
require 'colorize'
require 'gemoji'

BASE_URL = 'https://data.cityofnewyork.us/resource/swhp-yxa4.json'

data = open(BASE_URL).read
parsed_data = JSON.parse(data, headers: true, header_converters: :symbol)

# puts :raised_hands
puts "Below are the current departments with open positions.".yellow
puts ""
departments = parsed_data.map do |element|
  # element.default = "Keys not defined"
  element['agency'].blue
end

puts departments.uniq
puts Emoji.find_by_alias("raised_hands").raw
puts Emoji.find_by_alias("thumbsup").raw



puts "What department are you interested in?".yellow
searched_industry = gets.chomp
puts ""

# choices = parsed_data.select do |element|
#   # element.default = "Keys not defined"
#   searched_industry.downcase == element['agency'].downcase
# end
# if choices.empty?
#   puts "please enter another choice."
# else




puts "Here are the available jobs in the #{searched_industry}.".yellow

# parsed_data = JSON.parse(data, headers: true, header_converters: :symbol)
puts "\n"
parsed_data.each do |element|
  # element.default = "Keys not defined"
  if searched_industry.downcase == element['agency'].downcase
    puts "#{element['business_title']}, #{element['civil_service_title']} $#{element['salary_range_to']}.".blue

  end
end

#look for industry
#look for job titles
#look for job salaries



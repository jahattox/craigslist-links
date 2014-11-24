# Simple script to create a list of Craigslist links from different areas of the world 
# to be used to upload many Craigslist RSS feeds to your reader at once. Useful when 
# looking for jobs or searching for specific items where distance/travel isn't an issue.

require 'nokogiri'
require 'open-uri'

# Get Craigslist page.
doc = Nokogiri::HTML(open('http://www.craigslist.org/about/sites'))

links = Array.new

# Loop over the first four Craigslist "areas."
# 1 - 4 correspond to the different areas of the US, 5 - 8 correspond to Canada, 
# 9 - 12 correspond to Europe, and 13 - 16 correspond to Asia, Pacific, and Middle East.
# Within each .box, find all links and push to array.
doc.css('.box').first(4).each do |box|
  box.css('a').each do |link|
    # Append the desired RSS criteria to each link.
    links.push ( link['href'] + "/example" )
  end
end

puts links
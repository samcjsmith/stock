require "HTTParty"
require "Nokogiri"

print "Please enter the stock symbol: "
stock = gets.chomp.downcase


response = HTTParty.get("http://finance.yahoo.com/q?s=#{stock}")

# p response.body.class

body = response.body

dom = Nokogiri::HTML(body)

# p dom.css('#yfs_l84_aapl').first.text #its the first element of arr.

puts "Current Stock Price: $#{dom.css("#yfs_l84_#{stock}").first.text}"

puts "Previous Stock Price: $#{dom.css('.yfnc_tabledata1').first.text}"

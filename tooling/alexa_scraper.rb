require 'pry'
require 'open-uri'
require 'nokogiri'

sites = []
for i in 0..20
  url = "http://www.alexa.com/topsites/global;#{i}"
  doc = Nokogiri::HTML(open(url).read)
  page = doc.css('.desc-paragraph a').map {|x|x.text}
  page.select! {|x|x[-4..-1] == ".com" }
  page.select! {|x|x.count(".") == 1}
  page.map! {|x|x.gsub(".com", "")}
  sites += page
  puts page
end

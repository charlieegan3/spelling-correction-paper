require 'pry'
require 'open-uri'
require 'nokogiri'

sites = []
for i in 0..20
  url = "http://www.alexa.com/topsites/global;#{i}"
  doc = Nokogiri::HTML(open(url).read)
  sites += doc.css('.desc-paragraph a').map {|x|x.text.gsub(/\.\w+/, '')}
  puts sites
end

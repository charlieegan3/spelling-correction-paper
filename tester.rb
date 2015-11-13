require "open-uri"
require "json"


File.open('run.txt').readlines.map(&:chomp).each do |line|
  intended, corruption = line.split(" ")

  result = JSON.parse(open("http://sirjest.herokuapp.com/?q=#{URI::encode(corruption)}").read)
  #result = JSON.parse(open("http://localhost:3000/?q=#{corruption}").read)

  print [intended, corruption].join(" ")

  result.each do |k, v|
    # puts "#{k}: #{v["SuggestedTerm"]} #{v["TopTitle"]}"
    v = [v["SuggestedTerm"], v["TopTitle"]].map(&:downcase).map(&:strip)
    print " "
    print " " + v.map(&:downcase).map(&:strip).include?(intended.downcase).to_s
  end
  puts
end


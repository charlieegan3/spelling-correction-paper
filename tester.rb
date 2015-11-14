require "open-uri"
require "json"

server = 1

output = ""

File.open('run.txt').readlines.map(&:chomp).each do |line|
  sleep 0.5
  intended, corruption = line.split(" ")

  server += 1 if server == 3 || server == 4
  server += 1 if server == 3 || server == 4

  result = JSON.parse(open("http://sirjest#{server}.herokuapp.com/?q=#{URI::encode(corruption)}").read)
  #result = JSON.parse(open("http://localhost:3000/?q=#{corruption}").read)

  output += [server, intended, corruption].join("\t")

  print [server, intended, corruption].join("\t")

  result.each do |k, v|
    status = v['StatusCode']

    v = [v["SuggestedTerm"], v["TopTitle"]].map(&:downcase).map(&:strip)
    if status == 200
      output += "\t" + v.map(&:downcase).map(&:strip).map(&:split).map(&:join).include?(intended.downcase).to_s
      print "\t" + v.map(&:downcase).map(&:strip).map(&:split).map(&:join).include?(intended.downcase).to_s
    else
      output += "\t" + status.to_s
      print "\t" + status.to_s
    end
  end

  server += 1
  server = 1 if server > 5
  output += "\n"
  puts
end

File.open('output.tsv', 'w').write output


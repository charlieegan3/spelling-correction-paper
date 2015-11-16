require "open-uri"
require "json"

servers = [1,2,3,4,5]

output = ""

File.open('run.txt').readlines.map(&:chomp).each do |line|
  intended, corruption = line.split(" ")

  server = servers.sample
  puts "server" + server.to_s

  result = JSON.parse(open("http://sirjest#{server}.herokuapp.com/?q=#{URI::encode(corruption)}").read)

  #result = JSON.parse(open("http://localhost:3000/?q=#{corruption}").read)

  output += [server, intended, corruption].join("\t")
  print [server, intended, corruption].join("\t")

  result.each do |k, v|
    status = v['StatusCode']

    v = v['ResponseText'].downcase.split.join
    if status == 200
      output += "\t" + v.include?(intended.downcase).to_s
      print "\t" + v.include?(intended.downcase).to_s
    else
      output += "\t" + status.to_s
      print "\t" + status.to_s
    end
  end

  output += "\n"
  puts
end

File.open('output.tsv', 'w').write output


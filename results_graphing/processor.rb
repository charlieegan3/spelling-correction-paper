table4 = File.open("4.tsv").readlines.map(&:chomp).map {|x|x.split("\t")}
table8 = File.open("8.tsv").readlines.map(&:chomp).map {|x|x.split("\t")}
table12 = File.open("12.tsv").readlines.map(&:chomp).map {|x|x.split("\t")}

table4 = table4.map {|x|x[3..-1]}
table8 = table8.map {|x|x[3..-1]}
table12 = table12.map {|x|x[3..-1]}

table = {"ask"=>0, "baidu"=>0, "bing"=>0, "duckduckgo"=>0, "google"=>0, "sogou"=>0, "yahoo"=>0, "yandex"=>0, "youdao"=>0}
index = table4.first
output_table = Hash.new([])

[table4, table8, table12].each do |raw_table|
  length_table = {"ask"=>0, "baidu"=>0, "bing"=>0, "duckduckgo"=>0, "google"=>0, "sogou"=>0, "yahoo"=>0, "yandex"=>0, "youdao"=>0}
  raw_table.each do |row|
    row.each_with_index do |result, i|
      table[index[i]] += 1 if result == "true"
      length_table[index[i]] += 1 if result == "true"
    end
  end
  length_table.each do |k,v|
    output_table[k] += [(v.to_f / 3).round(5)]
  end
end

engine_file = File.open('engine_result.tsv', 'w')
engine_file.write "engine\tresult\tlength\trank\n"

index = [4,8,12].map {|x|"#{x} chars"}
regions = {"ask"=>"us", "baidu"=>"asia", "bing"=>"us", "duckduckgo"=>"us", "google"=>"us", "sogou"=>"asia", "yahoo"=>"us", "yandex"=>"asia", "youdao"=>"asia"}
ranks = {"ask"=>"33", "baidu"=>"4", "bing"=>"21", "duckduckgo"=>"601", "google"=>"1", "sogou"=>"99", "yahoo"=>"5", "yandex"=>"2190", "youdao"=>"597"}
output_table.each do |k, v|
  v.each_with_index do |v2, i|
    engine_file.write [k, v2/100, index[i], ranks[k]].join("\t") + "\n"
  end
end

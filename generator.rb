require 'levenshtein'
# sites = ['Google', 'Yahoo!', 'Amazon', 'Reddit', 'PayPal', 'tumblr', 'Go.com', 'GitHub', 'Popads']
# sites = ['Spaceshipads', 'Secureserver', 'Shutterstock', 'Espncricinfo', 'Steampowered', 'Mercadolivre', 'Extratorrent', 'Liveinternet', 'Infusionsoft', 'Surveymonkey']
# sites = ['Ebay', 'Bing', 'Imdb', 'Etsy', 'Yelp', 'Cnet', 'Vice', 'Ikea', '9gag', 'Hulu', 'Dell', 'Citi', 'Asos', 'Java']
# sites = ['Facebook', 'Linkedin', 'Blogspot', 'Flipkart', 'Outbrain', 'Buzzfeed', 'Whatsapp', 'Softonic', 'Usatoday', 'Mashable', 'Engadget', 'Gsmarena', 'Evernote', 'Theverge']
sites = ['Soundcloud', 'Wellsfargo', 'Salesforce', 'Deviantart', 'Capitalone', 'Lifehacker', 'Allrecipes', 'Techcrunch']

key_map = {
  'a' => %w(q w s z `),
  'b' => %w(v g h n),
  'c' => %w(x d f v),
  'd' => %w(s e r f c x),
  'e' => %w(w 3 4 r d s),
  'f' => %w(d r t g v c),
  'g' => %w(f t y h b v),
  'h' => %w(g y u j n b),
  'i' => %w(u 8 9 o k j),
  'j' => %w(h u i k m n),
  'k' => %w(j i o l , m),
  'l' => %w(k o p ; . ,),
  'm' => %w(n j k ,),
  'n' => %w(b h j m),
  'o' => %w(i 9 0 p l k),
  'p' => %w(o 0 - [ ; l),
  'q' => %w(1 2 w a),
  'r' => %w(e 4 5 t f d),
  's' => %w(a w e d x z),
  't' => %w(r 5 6 y g f),
  'u' => %w(y 7 8 i j h),
  'v' => %w(c f g b),
  'w' => %w(q 2 3 e s a),
  'x' => %w(z s d c),
  'y' => %w(t 6 7 u h g),
  'z' => %w(` a s x),
  '.' => %w(, l ; /),
  '!' => %w(@ 2 1 q §),
  '0' => %w(- p o 9),
  '1' => %w(§ q 2),
  '2' => %w(1 q w 3),
  '3' => %w(2 w e 4),
  '4' => %w(3 e r 5),
  '5' => %w(4 r t 6),
  '6' => %w(5 t y 7),
  '7' => %w(6 y u 8),
  '8' => %w(7 u i 9),
  '9' => %w(8 i o 0),
}

def corrupt(string, count, key_map)
  string.downcase!
  indexes = (0..string.length-1).to_a.shuffle

  count.times do
    index = indexes.pop
    string[index] = key_map[string[index]].sample
  end

  return string
end

corruptions = []
timeout = 1000
sites.each do |site|
  site_corruptions = []
  attempts = 0
  loop do
    site_corruptions << [site, corrupt("#{site}", 3, key_map)].join(" ")
    break if site_corruptions.uniq.size == 6

    attempts += 1
    break if attempts > timeout
  end
  corruptions += site_corruptions.uniq
end

puts corruptions.size

File.open('run.txt', 'w').write(corruptions.join("\n") + "\n")

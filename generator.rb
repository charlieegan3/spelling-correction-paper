require 'levenshtein'
sites = ['Google', 'Yahoo!', 'Amazon', 'Reddit', 'PayPal', 'tumblr', 'Go.com', 'GitHub', 'Popads']

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
}

def corrupt(string, count, key_map)
  chars = string.chars.shuffle
  count.times do
    index = string.index(chars.pop)
    string[index] = key_map[string[index].downcase].sample
  end
  return string
end

corruptions = []
timeout = 1000
sites.each do |site|
  site_corruptions = []
  attempts = 0
  loop do
    site_corruptions << [site, corrupt("#{site}", 4, key_map)].join(" ")
    break if site_corruptions.uniq.size == 36
    attempts += 1
    break if attempts > timeout
  end
  corruptions += site_corruptions.uniq
end

puts corruptions.size

File.open('run.txt', 'w').write(corruptions.join("\n") + "\n")

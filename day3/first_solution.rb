lines = $data.split("\n")
letters = (?a..?z).to_a + (?A..?Z).to_a

x = lines.map do |line|
  x = line.chars.take(line.length/2)
  y = line.chars.drop(line.length/2)
  z = (x & y).first

  letters.index(z) + 1
end

p x.sum

x = lines.each_slice(3).map do |a,b,c|
  z = (a.chars & b.chars & c.chars).first

  letters.index(z) + 1
end

p x.sum

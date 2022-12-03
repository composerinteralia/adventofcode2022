lines = $data.split("\n").map(&:chars)
values = Hash[("a".."z").zip(1..26) + ("A".."Z").zip(27..52)]

part1 = lines.sum do |line|
  intersection = line.take(line.size / 2) & line.drop(line.size / 2)
  values[intersection.first]
end

p part1

part2 = lines.each_slice(3).sum do |a,b,c|
  intersection = a & b & c
  values[intersection.first]
end

p part2

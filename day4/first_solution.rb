lines = $data.split("\n")

part1 = lines.count do |line|
  r1,r2 = line.split(",").map { _1.split("-").map(&:to_i) }.map { _1.._2 }
  r1.cover?(r2) || r2.cover?(r1)
end

p part1

part2 = lines.count do |line|
  r1,r2 = line.split(",").map { _1.split("-").map(&:to_i) }.map { _1.._2 }
  r1.end >= r2.begin && r2.end >= r1.begin
end

p part2

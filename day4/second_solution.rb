ranges = $data.split("\n").map do |line|
  line.split(",")
    .map { _1.split("-").map(&:to_i) }
    .map { _1.._2 }
end

p ranges.count { |r1, r2| r1.cover?(r2) || r2.cover?(r1) }
p ranges.count { |r1, r2| r1.end >= r2.begin && r2.end >= r1.begin }

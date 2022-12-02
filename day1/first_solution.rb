paragraphs = $data.split("\n\n")
totals = paragraphs.map { _1.split("\n").map(&:to_i).sum }

p totals.max
p totals.max(3).sum

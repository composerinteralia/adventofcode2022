rows = $data.split("\n").map { _1.split("").map(&:to_i) }
columns = rows.transpose

visible = (columns.length + rows.length - 2) * 2
top_scenic_index = 0

puts "\e[32m#{rows[0].join}\e[0m"
(1...rows.length - 1).each do |r|
  print "\e[32m#{rows[r][0]}\e[0m"
  (1...columns.length - 1).each do |c|
    row = rows[r]
    column = columns[c]
    height = row[c]

    if row.take(c).all? { _1 < height } ||
       row.drop(c + 1).all? { _1 < height } ||
       column.take(r).all? { _1 < height } ||
       column.drop(r + 1).all? { _1 < height }
      visible += 1

      print "\e[32m#{height}\e[0m"
    else
      print "\e[31m#{height}\e[0m"
    end

    scenic_index =
      (row[1...c].reverse.take_while { _1 < height }.length + 1) *
      (row[c + 1...-1].take_while { _1 < height }.length + 1) *
      (column[1...r].reverse.take_while { _1 < height }.length + 1) *
      (column[r + 1...-1].take_while { _1 < height }.length + 1)
    top_scenic_index = [top_scenic_index, scenic_index].max
  end
  puts "\e[32m#{rows[r][-1]}\e[0m"
end
puts "\e[32m#{rows[-1].join}\e[0m"

p visible
p top_scenic_index

rows = $data.split("\n").map { _1.split("").map(&:to_i) }
columns = rows.transpose

v,i = 0,0

rows.each_with_index do |row, r|
  columns.each_with_index do |column, c|
    ts = [row.take(c).reverse, row.drop(c + 1), column.take(r).reverse, column.drop(r + 1)]
    v += 1 if ts.any? { _1.empty? || _1.max < row[c] }
    i = [i, ts.map { |t| t[...-1].take_while { _1 < row[c] }.size + 1 }.inject(&:*)].max
  end
end

p v,i

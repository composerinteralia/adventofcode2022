require 'set'

start, finish = nil
grid = $data.split("\n").map.with_index do |line, row|
  line.chars.map.with_index do |char, col|
    if char == ?S
      start = [row, col]
      char = ?a
    elsif char == ?E
      finish = [row, col]
      char = ?z
    end
    char.ord - ?a.ord
  end
end

Pos = Struct.new(:value, :length) do
  def next(x, y)
    Pos.new([row + x, col + y], length + 1)
  end

  def within?(grid)
    (0...grid.length).cover?(row) && (0...grid[0].length).cover?(col)
  end

  def row = value[0]
  def col = value[1]
end


def neighbors(pos, grid)
  [[1, 0], [-1, 0], [0, 1], [0, -1]].filter_map do |x, y|
    new_pos = pos.next(x, y)
    new_pos if new_pos.within?(grid)
  end
end

def run(start, finish, grid)
  i = 0
  seen = Set.new([start])
  to_visit = [Pos.new(start, 0)]

  while pos = to_visit.shift
    return pos.length if pos.value == finish

    neighbors(pos, grid).each do |neighbor|
      next if seen.include?(neighbor.value)
      next if grid[neighbor.row][neighbor.col] > grid[pos.row][pos.col] + 1
      to_visit << neighbor
      seen << neighbor.value
    end
  end
end

p run(start, finish, grid)

def run2(start, grid)
  i = 0
  seen = Set.new([start])
  to_visit = [Pos.new(start, 0)]

  while pos = to_visit.shift
    return pos.length if grid[pos.row][pos.col].zero?

    neighbors(pos, grid).each do |neighbor|
      next if seen.include?(neighbor.value)
      next if grid[neighbor.row][neighbor.col] + 1 < grid[pos.row][pos.col]
      to_visit << neighbor
      seen << neighbor.value
    end
  end
end

p run2(finish, grid)

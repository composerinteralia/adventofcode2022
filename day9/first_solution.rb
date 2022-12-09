require 'set'

Pos = Struct.new(:row, :col) do
  def +(other) = Pos.new(row + other.row, col + other.col)
  def ==(other) = row == other.row && col == other.col
end

MOVES = {
  'UL' => Pos.new(-1,-1), 'U' => Pos.new(-1,0), 'UR' => Pos.new(-1,1),
  'L'  => Pos.new(0,-1),  'R' => Pos.new(0,1),  ''   => Pos.new(0,0),
  'DL' => Pos.new(1,-1),  'D' => Pos.new(1,0),  'DR' => Pos.new(1,1)
}

def next_tail(head, tail)
  if MOVES.values.any? { |neighbor| head + neighbor == tail }
    tail
  else
    ud = case head.row <=> tail.row
         when -1 then "U"
         when 1 then "D"
         else ""
         end

    lr = case head.col <=> tail.col
         when -1 then "L"
         when 1 then "R"
         else ""
         end

    tail + MOVES["#{ud}#{lr}"]
  end
end

# Part 1 setup
head = Pos.new(0, 0)
tail = Pos.new(0, 0)
visited = Set.new([tail])

# Part 2 setup
long = Array.new(10) { Pos.new(0,0) }
long_tail_visited = Set.new([long.last])

$data.split("\n").each do |line|
  dir, count = line.split
  move = MOVES[dir]
  count.to_i.times do

    # Part 1
    head = head + move
    tail = next_tail(head, tail)
    visited << tail

    # Part 2
    long[0] = long[0] + move
    9.times { |i| long[i + 1] = next_tail(long[i], long[i + 1]) }
    long_tail_visited << long.last
  end
end

p visited.count
p long_tail_visited.count

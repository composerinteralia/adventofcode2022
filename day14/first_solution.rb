Pos = Struct.new(:x, :y) do
  def line(other)
    if x == other.x
      Range.new(*[y, other.y].sort).map { Pos.new(x, _1) }
    else
      Range.new(*[x, other.x].sort).map { Pos.new(_1, y) }
    end
  end

  def +((x_offset, y_offset))
    Pos.new(x + x_offset, y + y_offset)
  end

  def coords
    [x, y]
  end
end

require "set"
$blocked = Set.new

$data.split("\n").map do |line|
  line.split(" -> " )
    .map { |coord| Pos.new(*coord.split(",").map(&:to_i).reverse) }
    .each_cons(2) { _1.line(_2).map { |rock| $blocked << rock.coords } }
end

start = Pos.new(0, 500)
$last_rock_x = $blocked.sort_by { _1[0] }[-1][0]

def fall(start)
  new_pos = [0, -1, 1].filter_map do |y_offset|
    new_pos = start + [1, y_offset]
    new_pos unless $blocked.include?(new_pos.coords) || new_pos.x > $last_rock_x + 1
  end.first

  if new_pos
    fall(new_pos) if new_pos.x < $last_rock_x #part 1
    # fall(new_pos) #part 2
  else
    start
  end
end

count = 0

while true
  resting_pos = fall(start)
  if resting_pos
    count += 1
    $blocked << resting_pos.coords
  end

  if !resting_pos || resting_pos == start
    break
  end
end

p count

# Not fast or elegant, but it works :-)

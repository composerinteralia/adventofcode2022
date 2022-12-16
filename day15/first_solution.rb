LINE = /Sensor at x=(-?\d+), y=(-?\d+): closest beacon is at x=(-?\d+), y=(-?\d+)/

def merge_ranges(ranges)
  sorted = ranges.sort_by(&:begin)
  lowest = highest = sorted[0].begin
  new_ranges = []

  sorted.each do 
    if _1.begin - highest > 1
      new_ranges << (lowest..highest)
      lowest, highest = _1.begin, _1.end
    else
      highest = [highest, _1.end].max
    end
  end

  new_ranges << (lowest..highest)

  new_ranges
end

### Part 1
relevant_y = 2000000
beacons = []
no_beacon_ranges = []

$data.split("\n").each do |line|
  sensor_x, sensor_y, beacon_x, beacon_y = line.match(LINE).captures.map(&:to_i)
  distance = (sensor_x - beacon_x).abs + (sensor_y - beacon_y).abs

  beacons << beacon_x if beacon_y == relevant_y

  distance_to_relevant_y = (sensor_y - relevant_y).abs
  if distance_to_relevant_y <= distance
    range = distance - distance_to_relevant_y
    no_beacon_ranges << (sensor_x - range..sensor_x + range)
  end
end

p merge_ranges(no_beacon_ranges).map(&:count).sum - beacons.uniq.count

### Part 2
beacon_bounds = 0..4000000

# LOL, this is not a good idea, but who cares
ranges = Array.new(beacon_bounds.end + 1) { [] }

$data.split("\n").each do |line|
  sensor_x, sensor_y, beacon_x, beacon_y = line.match(LINE).captures.map(&:to_i)
  distance = (sensor_x - beacon_x).abs + (sensor_y - beacon_y).abs

  0.upto(distance) do |i|
    offset = distance - i
    range = (sensor_x - offset..sensor_x + offset)
    if range.end >= beacon_bounds.begin && range.begin <= beacon_bounds.end
      ranges[sensor_y + i] << range if beacon_bounds.cover?(sensor_y + i)
      ranges[sensor_y - i] << range if beacon_bounds.cover?(sensor_y - i) && !i.zero?
    end
  end
end

ranges.map! { merge_ranges(_1) }
y = ranges.index { _1.length > 1 }
x = ranges[y][0].end + 1
p (x * 4000000) + y

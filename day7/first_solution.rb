require 'set'

CD = /\$ cd (.*)/
FILE = /(\d+) (.*)/

dirs = []
counts = Hash.new(0)
seen = Set.new

$data.each_line do |line|
  if match = CD.match(line)
    case dir = match[1]
    when "/" then dirs = [dir]
    when ".." then dirs.pop
    else dirs << dir
    end
  elsif match = FILE.match(line)
    abs_path = [*dirs, match[2]].join(":")
    if !seen.include?(abs_path)
      dirs.each_index { |i| counts[dirs[0..i].join(":")] += match[1].to_i }
      seen << abs_path
    end
  end
end

p counts.values.select { _1 < 100000 }.sum

needed = counts["/"] - 40000000
p counts.values.select { _1 > needed }.min


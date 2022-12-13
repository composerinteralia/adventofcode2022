compare = ->(left, right) do
  if left.is_a?(Array) && right.is_a?(Array)
    left.zip(right).each do |l, r|
      break if r.nil?
      c = compare.(l, r)
      return c unless c.zero?
    end
    left.length <=> right.length
  elsif left.is_a?(Array)
    compare.(left, [right])
  elsif right.is_a?(Array)
    compare.([left], right)
  else
    left <=> right
  end
end

packets = $data.split("\n").reject(&:empty?).map { eval(_1) }

# Part 1
p packets.each_slice(2).with_index(1).filter_map { _2 if compare.(*_1) == -1 }.sum

# Part 2
dividers = [[[2]],[[6]]]
sorted = (packets + dividers).sort(&compare)
p dividers.map { sorted.index(_1) + 1 }.inject(:*)

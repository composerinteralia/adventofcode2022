$raw_stacks,$insns = $data.split("\n\n")

def build_stacks
  *raw_stacks,stack_nums = $raw_stacks.split("\n")
  stack_idxs = stack_nums.split.map { stack_nums.index(_1) }

  Array.new(stack_idxs.length) { [] }.tap do |stacks|
    populate_stacks(stacks, raw_stacks, stack_idxs)
  end
end

def populate_stacks(stacks, raw_stacks, stack_idxs)
  stack_idxs.each_with_index do |stack_idx,i|
    raw_stacks.reverse_each do |line|
      break if line[stack_idx].strip.empty?
      stacks[i] << line[stack_idx]
    end
  end
end

INSN = /move (\d+) from (\d+) to (\d+)/
def operate
  $insns.split("\n").each do |insn|
    count,from,to = insn.match(INSN).captures.map(&:to_i)
    yield count, from, to
  end
end

# Part 1
stacks = build_stacks
operate do |count, from, to|
  count.times do
    stacks[to - 1] << stacks[from - 1].pop
  end
end
puts stacks.map { _1.last }.join

# Part 1
stacks = build_stacks
operate do |count, from, to|
  stacks[to - 1].push(*stacks[from - 1].pop(count))
end
puts stacks.map { _1.last }.join


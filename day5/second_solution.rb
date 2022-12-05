$raw_stacks,$insns = $data.split("\n\n")

def run
  build_stacks.tap do |stacks|
    follow_insns { |count, from, to| yield count, stacks[to -1], stacks[from -1] }
    puts stacks.map { _1.last }.join
  end
end

def build_stacks
 $raw_stacks.split("\n")[0...-1]
   .map { parse_stack_line(_1) }
   .reverse.transpose.map(&:compact)
end

def parse_stack_line(line)
  line.chars.each_slice(4).map { _1[1] unless _1[1].strip.empty? }
end

def follow_insns
  $insns.split("\n").each { |insn| yield *insn.scan(/\d+/).map(&:to_i) }
end

run { |count, to, from| count.times { to << from.pop } }
run { |count, to, from| to.push(*from.pop(count)) }

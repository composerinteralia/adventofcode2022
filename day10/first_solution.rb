insns = $data.split("\n").map(&:chomp).map do |insn|
  op, arg = /(addx|noop) ?(.*)?/.match(insn).captures
  op == "addx" ? [2, arg.to_i] : [1, 0]
end

x = 1
cycle = 0
strengths = 0

insns.each do |cycles, arg|
  cycles.times do
    cycle += 1

    print (x - 1..x + 1).cover?((cycle - 1) % 40) ? "#" : " "
    puts if cycle % 40 == 0

    strengths += cycle * x if cycle % 40 == 20
  end

  x += arg
end

p strengths

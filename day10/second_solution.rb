class CPU
  def initialize(*cb)
    @cycle = 0
    @x = 1
    @cb = cb
  end

  def noop(*) = cycle

  def addx(n)
    2.times { cycle }
    @x += n.to_i
  end

  private

  def cycle
    @cycle += 1
    @cb.each { _1.(@cycle, @x) }
  end
end

part1 = Struct.new(:strength) do
  def call(cycle, x) = (self.strength += cycle * x if cycle % 40 == 20)
end.new(0)

part2 = -> (cycle, x) do
  print (x - 1..x + 1).cover?((cycle - 1) % 40) ? "#" : " "
  puts if cycle % 40 == 0
end

cpu = CPU.new(part1, part2)

$data.split("\n").map { |insn| cpu.send(*insn.split) }

p part1.strength

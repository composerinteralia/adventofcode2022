class Monkey
  attr_reader :count, :div

  def initialize(items, operation, div, t, f)
    @items = items
    @operation = operation
    @div = div
    @t = t
    @f = f
    @count = 0
  end

  def inspect_items(monkeys, reduce)
    @items.each do |item|
      @count += 1
      new = reduce.(@operation.call(item))
      monkeys[new % @div == 0 ? @t : @f] << new
    end

    @items.clear
  end

  def <<(item)
    @items << item
  end
end

def parse_monkeys
  $data.split("\n\n").map do |monkey_data|
    notes = monkey_data.split("\n")
    item = notes[1][18..].split(", ").map(&:to_i)
    operation = -> (old) { eval(notes[2][19..]) }
    div = notes[3].split.last.to_i
    t = notes[4].split.last.to_i
    f = notes[5].split.last.to_i

    Monkey.new(item, operation, div, t, f)
  end
end

parse_monkeys.tap do |monkeys|
  20.times do
    monkeys.each { |monkey| monkey.inspect_items(monkeys, -> { _1 / 3 }) }
  end
  p monkeys.map(&:count).max(2).inject(&:*)
end

parse_monkeys.tap do |monkeys|
  10000.times do
    monkeys.each do |monkey|
      monkey.inspect_items(monkeys, -> { _1 % monkeys.map(&:div).inject(&:*) })
    end
  end
  p monkeys.map(&:count).max(2).inject(&:*)
end

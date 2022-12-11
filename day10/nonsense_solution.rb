puts ($data.split("\n")
  .map { [_1[0].ord % 14 - 11, _1[5..].to_i] }
  .inject([0, 1, 0]) do |(cycle, x, strength), (cycles, n)|
    cycles.times do
      cycle += 1
      strength += cycle * x if cycle % 40 == 20
      print (x - 1..x + 1).cover?((cycle - 1) % 40) ? ?# : ?.
      puts if cycle % 40 == 0
    end
    x += n
    [cycle, x, strength]
  end.last)

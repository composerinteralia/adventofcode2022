def marker(n)
  i = 0
  x = Array.new(n)
  while (c = $data[i]) do
    x << c
    x.shift if x.length > n
    if x.compact.uniq.length == n
      return i + 1
    end
    i += 1
  end
end

p marker(4)
p marker(14)

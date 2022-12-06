def marker(n)
  $data.chars.each_cons(n).with_index(n) { return _2 if _1.uniq.length == n }
end

p marker(4)
p marker(14)

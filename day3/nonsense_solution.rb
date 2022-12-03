x=$data.split("\n").map(&:chars)
p x.sum{((_1.take(_1.size/2)&_1.drop(_1.size/2)).first.ord-96)%58}
p x.each_slice(3).sum{((_1&_2&_3).first.ord-96)%58}

r=(e=[]).size;s=[].dup;while($data[r]);$data[r].ord==10?(e<<s&&s=[]):s<<$data[r].ord;r+=1;end
p e.sum{((_1.take(_1.size/2)&_1.drop(_1.size/2)).first-96)%58}
p e.each_slice(3).sum{((_1&_2&_3).first-96)%58}

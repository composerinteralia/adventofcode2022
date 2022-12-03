l=(aw=[]).size;while($data[l]);(aw[-1]&&!aw[-1][1])?aw[-1]<<$data[l].ord-87 :
aw<<[$data[l].ord-64]if$data[l].ord>32;l+=1;end

# Part 1
p aw.sum{(((x=((_1-_2)%3))^1)<<1)+(x*3>>1&1^1)+_2}
# Part 2
p aw.sum{(_1+_2)%3+1+(_2-1)*3}

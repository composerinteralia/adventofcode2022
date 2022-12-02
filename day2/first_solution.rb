choice = { "X" => 1, "Y" => 2, "Z" => 3 }

outcome = {
"A X" => 3,
"A Y" =>6,
"A Z" =>0,
"B X" =>0,
"B Y" =>3,
"B Z" =>6,
"C X" =>6,
"C Y" =>0,
"C Z" => 3,
}

p $data.split("\n").map(&:chomp).map { |line| outcome[line] + choice[line.split.last] }.sum

choice = { "X" => 0, "Y" => 3, "Z" => 6 }

outcome = {
"A X" => 3,
"A Y" =>1,
"A Z" =>2,
"B X" =>1,
"B Y" =>2,
"B Z" =>3,
"C X" =>2,
"C Y" =>3,
"C Z" =>1 ,
}

p $data.split("\n").map(&:chomp).map { |line| outcome[line] + choice[line.split.last] }.sum

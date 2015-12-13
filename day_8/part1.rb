lines = File.readlines('input.txt').map(&:chomp)

all = lines.map{|b| b.length}.inject(&:+)
short = lines.map{ |b| eval(b).length }.inject(&:+)

puts all - short

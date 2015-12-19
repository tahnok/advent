raw = File.readlines('input.txt').map(&:chomp)

seating = {}

def uniq_cycles(array)
  head = array.shift

  array.permutation.map{|tail|
    [head] + tail
  }
end

def net_happiness(seating, order)
  order.each_cons(3).map{|left, middle, right|
    seating[middle][left] + seating[middle][right]
  }.inject(&:+) +
  seating[order[0]][order[1]] + seating[order[0]][order[-1]] +
  seating[order[-1]][order[0]] + seating[order[-1]][order[-2]]
end

raw.each do |arrangement|
  /(?<target>\w+) would (?<direction>\w+) (?<ammount>\d+) happiness units by sitting next to (?<dest>\w+)/ =~ arrangement
  seating[target] ||= {}
  ammount = ammount.to_i
  ammount = -ammount if direction == "lose"
  seating[target][dest] = ammount
end

puts uniq_cycles(seating.keys).map {|order|
  net_happiness(seating, order)
}.max

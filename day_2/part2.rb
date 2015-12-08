dimensions = File.readlines("input.txt").map(&:chomp).compact
size = 0

dimensions.each do |dimension|
  a, b, c = dimension.split("x").map(&:to_i).sort
  next unless a
  size = size + (a * b * c + (a + b) * 2)
end

puts size

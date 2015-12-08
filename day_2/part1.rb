dimensions = File.readlines("input.txt").map(&:chomp).compact
size = 0

dimensions.each do |dimension|
  a, b, c = dimension.split("x").map(&:to_i).sort
  next unless a
  size = size + (3 * a * b + 2 * b * c + 2 * a * c)
end

puts size

directions = File.read('input.txt').chars.each_slice(2).to_a[0..-2]

real = {
  x: 0,
  y: 0,
}

robo = {
  x: 0,
  y: 0,
}

visited = {}

def move(santa, direction, visited)
  key = [santa[:x], santa[:y]].join(',')
  if visited[key]
    visited[key] += 1
  else
    visited[key] = 1
  end

  case direction
  when "v"
    santa[:y] -= 1
  when "^"
    santa[:y] += 1
  when ">"
    santa[:y] += 1
  when "<"
    santa[:y] -= 1
  end
  [santa, visited]
end


directions.each do |real_dir, robo_dir|
  real, visited = move(real, real_dir, visited)
  robo, visited = move(robo, robo_dir, visited)
end

puts visited.keys.length
require 'pry'; binding.pry
"test"

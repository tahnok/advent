directions = File.read('input.txt').chars

visited = {}

x = 0
y = 0

directions.each do |direction|
  key = "#{x},#{y}"
  if visited[key]
    visited[key] = visited[key] + 1
  else
    visited[key] = 1
  end

  case direction
  when "v"
    y = y - 1
  when "^"
    y = y + 1
  when ">"
    x = x + 1
  when "<"
    x = x - 1
  else
    next
  end
end

puts visited.keys.length

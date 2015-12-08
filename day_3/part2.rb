directions = File.read('input.txt').chars.each_slice(2).to_a[0..-2]

visited = {}

x = 0
y = 0

robo_x = 0
robo_y = 0

def update_visited(visited, x, y)
  key = "#{x},#{y}"
  if visited[key]
    visited[key] += 1
  else
    visited[key] = 1
  end
end

def update_dir(direction, x, y)
  case direction
  when "v"
    y -= 1
  when "^"
    y += 1
  when ">"
    x += 1
  when "<"
    x -= 1
  end
  [x, y]
end

directions.each do |direction, robo_dir|
  update_visited(visited, x, y)
  x, y = update_dir(direction, x, y)

  update_visited(visited, robo_x, robo_y)
  robo_x, robo_y = update_dir(robo_dir, robo_x, robo_y)

end

puts visited.keys.length

#2651

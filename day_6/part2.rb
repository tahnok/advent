require 'pry'
instructions = File.readlines('input.txt').map(&:chomp)

grid = Array.new(1000) { Array.new(1000, 0) }

def sum(grid)
  sum = 0
  grid.each_with_index do |row, x|
    row.each_with_index do |entry, y|
      sum += entry
    end
  end
  sum
end

instructions.each do |instruction|
  cmd, start_x, start_y, end_x, end_y = /(turn on|turn off|toggle) (\d+),(\d+) through (\d+),(\d+)/.match(instruction).captures
  start_x = start_x.to_i
  start_y = start_y.to_i
  end_x = end_x.to_i
  end_y = end_y.to_i

  if start_x > end_x
    end_x += 1000
  end

  if start_y > end_y
    end_y += 1000
  end

  (start_x..end_x).each do |x|
    (start_y..end_y).each do |y|
      case cmd
      when "turn on"
        grid[x % 1000][y % 1000] += 1
      when "turn off"
        grid[x % 1000][y % 1000] -= 1
        grid[x % 1000][y % 1000] = 0 if grid[x % 1000][y % 1000] < 0
      when "toggle"
        grid[x % 1000][y % 1000] += 2
      else
        fail "fuckkk"
      end
    end
  end
  puts instruction, sum(grid)
end

puts sum(grid)

#not 91300

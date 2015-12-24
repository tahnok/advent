require 'pry'

$board = File.open('input.txt').map{|line| line.chomp.chars.map{|c| c == '.' ? 0 : 1 } }
$size = $board.first.size - 1

def rule(board, x, y)
  sum = if x == 0
          if y == 0
            board[y + 1][x] +
            board[y][x + 1] +
            board[y + 1][x + 1]
          elsif y == $size
            board[y - 1][x] +
            board[y][x + 1] +
            board[y - 1][x + 1]
          else
            board[y - 1][x] + board[y - 1][x + 1] + board[y][x + 1] + board[y + 1][x] + board[y + 1][x + 1]
          end
        elsif x == $size
          if y == 0
            board[y][x - 1] +
            board[y + 1][x] +
            board[y + 1][x - 1]
          elsif y == $size
            board[y - 1][x] + board[y][x - 1] + board[y - 1][x - 1]
          else
            board[y - 1][x] + board[y - 1][x - 1] + board[y][x - 1] + board[y + 1][x] + board[y + 1][x - 1]
          end
        else
          if y == 0
            board[y][x - 1] + board[y][x + 1] + board[y + 1][x - 1] + board[y + 1][x] + board[y + 1][x + 1]
          elsif y == $size
            board[y][x - 1] + board[y][x + 1] + board[y - 1][x - 1] + board[y - 1][x] + board[y - 1][x + 1]
          else
            board[y - 1][x - 1] +
              board[y - 1][x] +
              board[y - 1][x + 1] +
              board[y][x - 1] +
              board[y][x + 1] +
              board[y + 1][x - 1] +
              board[y + 1][x] +
              board[y + 1][x + 1]
          end
        end
  if sum == 3 || (sum == 2 && board[y][x] == 1)
    [1, sum]
  else
    [0, sum]
  end
end

def tick(board)
  board.each_with_index.map{|row, y|
    row.each_with_index.map{|char, x|
      new, sum = rule(board, x, y)
      # puts "x: #{x}, y: #{y} old: #{char} new #{new} sum: #{sum}"
      new
    }
  }
end

def display(board)
  board.each do |row|
    puts row.map{|cell|
      cell == 0 ? "." : "#"
    }.join('')
  end
  puts ""
end

100.times do
  $board = tick($board)
end

puts $board.inject(0){|sum, row| sum + row.reduce(:+)}

binding.pry

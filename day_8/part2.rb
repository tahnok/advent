puts File.readlines('input.txt').map(&:chomp).map{|b| b.inspect.length - b.length}.inject(&:+)

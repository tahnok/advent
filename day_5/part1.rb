strings = File.readlines('input.txt').map(&:chomp)

count = 0

strings.each do |string|
  unless /(ab|cd|pq|xy)/ =~ string
    if /([a-z])\1/ =~ string
      if /([aeiou]).*\1.*\1/ =~ string
        puts string
        count += 1
      end
    end
  end
end

puts count

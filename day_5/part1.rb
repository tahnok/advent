strings = File.readlines('input.txt').map(&:chomp)

count = 0

strings.each do |string|
  unless /(ab|cd|pq|xy)/ =~ string
    puts "#{string} is free of bad tuples"
    if /([a-z])\1/ =~ string
      puts "#{string} has a double letter"
      if /([aeiou]).*([aeiou]).*([aeiou])/ =~ string
        puts string
        count += 1
      end
    end
  end
end

puts count

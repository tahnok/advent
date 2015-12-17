strings = File.readlines('input.txt').map(&:chomp)

count = 0

strings.each do |string|
  if /([a-z]{2}).*\1/ =~ string
    if /([a-z])([a-z])\1/ =~ string
    puts "#{string} has a repeat with space #{$1} #{$2}"
      puts string
      count += 1
    end
  end
end

puts count

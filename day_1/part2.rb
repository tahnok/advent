things = File.read('input.txt').chomp.chars

count = 0

things.each_with_index do |thing, index|
  if thing == '('
    count = count + 1
  else
    count = count - 1
  end
  fail "-1 at #{index}" if count == -1
end


thing = "1321131112".chars

50.times do
  thing = thing.slice_when{|x,y| x != y}.map do |run|
    "#{run.size}#{run.first}"
  end.join('').chars
end

puts thing.size

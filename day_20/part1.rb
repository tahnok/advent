require 'prime'
require 'pry'

binding.pry

def factors(n)
  (1..Math.sqrt(n).floor).map{|f|
    factor, remainder = n.divmod(f)
    if remainder == 0
      [f, factor]
    end
  }.compact.flatten.uniq
end

(2..(Float::INFINITY)).lazy.each do |n|
  x = factors(n).reduce(:+) * 11
  if x >= 29000000
    puts "#{n}: #{x}"
    break
  end
end


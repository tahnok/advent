require 'pry'

ingredients = Hash[File.open('input.txt').map{|line|
  /(?<name>\w+): capacity (?<capacity>[\-\d]+), durability (?<durability>[\-\d]+), flavor (?<flavor>[\-\d]+), texture (?<texture>[\-\d+]+), calories (?<calories>[\-\d]+)/ =~ line
  [name, [
    capacity.to_i,
    durability.to_i,
    flavor.to_i,
    texture.to_i,
    #calories.to_i,
  ]]
}]

puts ingredients.keys.repeated_combination(100).map {|combo|
  sums = combo.map{|key| ingredients[key]}.transpose.map{|row| row.inject(:+)}
  if sums.any?{|x| x < 0}
    0
  else
    sums.inject(:*)
  end
}.max

binding.pry

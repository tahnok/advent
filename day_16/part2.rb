require 'pry'

things = %i(children cats samoyeds pomeranians akitas vizslas goldfish trees cars perfumes)

aunts = File.open('input.txt').each_with_index.map{ |line, index|
  a = Hash[things.map{|thing|
    if /#{thing}: (\d+)/ =~ line
      [thing, $1.to_i]
    else
      [thing, nil]
    end
  }]
  a[:index] = index + 1
  a
}

restrictions = {
  children: 3,
  cats: 7,
  samoyeds: 2,
  pomeranians: 3,
  akitas: 0,
  vizslas: 0,
  goldfish: 5,
  trees: 3,
  cars: 2,
  perfumes: 1,
}

puts restrictions.inject(aunts){ |aunts, x|
  label, restriction = x
  aunts.select{ |aunt|
    if [:cats, :trees].include?(label)
      aunt[label].nil? || aunt[label] > restriction
    elsif [:pomeranians, :goldfish].include?(label)
      aunt[label].nil? || aunt[label] < restriction
    else
      aunt[label] == restriction || aunt[label].nil?
    end
  }
}.first[:index]

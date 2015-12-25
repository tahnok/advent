require 'pry'
require 'openssl'

def entry(row,column)
  1 + (1..row).reduce(:+) +
    (row+1..(row+column-1)).reduce(:+) - row
end

x = (252533.to_bn.mod_exp(entry(2981, 3075) - 1, 33554393) * 20151125) % 33554393

puts x

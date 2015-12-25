require 'pry'

$replacements = File.open('test.txt').inject({}){|x, line|
  /(\w+) => (\w+)/ =~ line
  x[$1] ||= []
  x[$1] << $2
  x
}

# $molecule = File.read('molecule').chomp
$molecule = 'HOHOHO'

$target = 'e'

$count = 0

things = [['e', 0]]

loop do
  stage, count = things.pop
  

end


puts $count

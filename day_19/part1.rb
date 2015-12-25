require 'pry'

$replacements = File.open('input.txt').inject({}){|x, line|
  /(\w+) => (\w+)/ =~ line
  x[$1] ||= []
  x[$1] << $2
  x
}

$molecule = File.read('molecule').chomp
# $molecule = "HOH"

def indices(str, match)
  start = -1
  result = []
  while start = str.index(match, start + 1)
    result << start
  end
  result
end

foo = $replacements.keys.map{|r|
  indices($molecule, r).map{|index|
    $replacements[r].map{|new|
      chars = $molecule.chars
      head = if index == 0
               []
             else
               chars[0..index-1]
             end
      middle = new.chars
      tail = chars[(index + r.size)..-1]
      x = (head + middle + tail).join('')
      x
    }
  }
}.flatten.uniq.size

puts foo


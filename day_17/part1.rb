require 'pry';
$sizes = [
  44,
  3,
  4,
  10,
  21,
  44,
  4,
  6,
  47,
  41,
  34,
  17,
  17,
  44,
  36,
  31,
  46,
  9,
  27,
  38,
].sort.reverse

$eggnog = 150

def combos(eggnog, containers)
  # puts "eggnog: #{eggnog} containers: #{containers}"
  containers.select{|c| eggnog >= c}.each_with_index.map{ |c, index|
    if c == eggnog
      [c]
    else
      combos(eggnog - c, containers[index+1..-1]).map {|x| x.push(c)}
    end
  }.reject{|x| x.empty?}
end

#not 53

binding.pry

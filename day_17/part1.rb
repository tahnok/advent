require 'pry';
# sizes = [
#   44,
#   3,
#   4,
#   10,
#   21,
#   44,
#   4,
#   6,
#   47,
#   41,
#   34,
#   17,
#   17,
#   44,
#   36,
#   31,
#   46,
#   9,
#   27,
#   38,
# ].sort

def combos(eggnog, containers)
  containers.select{|s| s <= eggnog}.each_with_index.map{|container, index|
    if container == eggnog
      [container]
    else
      combos(eggnog - container, containers[index+1..-1]).map{|thing|
        thing << container
      }
    end
  }.find{|x| x.reduce(:+) == eggnog} || []
end

$sizes = [ 20, 15, 10, 5, 5]
$eggnog = 25

binding.pry

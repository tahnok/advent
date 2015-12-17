raw_routes = File.readlines('input.txt').map(&:chomp)

routes = {}

raw_routes.each do |route|
  /(?<source>\w+) to (?<dest>\w+) = (?<weight>\d+)/ =~ route
  routes[source] ||= {}
  routes[source][dest] = weight.to_i
  routes[dest] ||= {}
  routes[dest][source] = weight.to_i
end


weights = routes.keys.permutation.map do |plan|
  plan.each_cons(2).map {|a, b|
    routes[a][b]
  }.inject(&:+)
end

puts weights.min
#207

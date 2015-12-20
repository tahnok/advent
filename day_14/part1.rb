require 'pry'

reindeers = File.open("input.txt").inject({}){|reindeers, reindeer|
  /(?<name>\w+) can fly (?<distance>\d+) km\/s for (?<move_t>\d+) seconds, but then must rest for (?<rest_t>\d+) seconds./ =~ reindeer
  reindeers[name] = {
    distance: distance.to_i,
    move_t: move_t.to_i,
    rest_t: rest_t.to_i,
  }
  reindeers
}

RACE = 2503

puts reindeers.map { |name, reindeer|
  total, left = RACE.divmod(reindeer[:move_t] + reindeer[:rest_t])
  part = if left >= reindeer[:move_t]
           reindeer[:move_t]
         else
           left
         end

  (total * reindeer[:move_t] + part) * reindeer[:distance]
}.max

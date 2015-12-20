require 'pry'

class Reindeer
  attr_accessor :name, :move_t, :rest_t, :state, :distance, :time_until_state_change, :travelled, :points

  def initialize(name, move_t, rest_t, distance)
    @state = :moving
    @name = name
    @move_t = move_t.to_i
    @rest_t = rest_t.to_i
    @distance = distance.to_i
    @travelled = 0
    @points = 0
    @time_until_state_change = move_t.to_i
  end

  def tick
    @time_until_state_change -= 1
    if @state == :moving
      @travelled += @distance
      if @time_until_state_change == 0
        @state = :resting
        @time_until_state_change = @rest_t
      end
    else
      if @time_until_state_change == 0
        @state = :moving
        @time_until_state_change = @move_t
      end
    end
  end
end

reindeers = File.open("input.txt").map{|reindeer|
  /(?<name>\w+) can fly (?<distance>\d+) km\/s for (?<move_t>\d+) seconds, but then must rest for (?<rest_t>\d+) seconds./ =~ reindeer
  Reindeer.new(name, move_t, rest_t, distance)
}

2503.times do
  reindeers.each do |reindeer|
    reindeer.tick
  end
  _, leaders = reindeers.group_by{|r| r.travelled}.max
  leaders.each do |leader|
    leader.points += 1
  end
end

puts reindeers.max_by{|r| r.points}.points

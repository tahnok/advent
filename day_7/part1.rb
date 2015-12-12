require 'pry'
instructions = File.readlines('input.txt').map(&:chomp)

context = {}
while instruction = instructions.pop
  if /\A(\d+) -> ([a-z]+)/ =~ instruction
    context[$2] = $1.to_i
  elsif /\A([a-z]+) -> ([a-z]+)/ =~ instruction
    if context[$1]
      context[$2] = context[$1]
    else
      instructions.unshift(instruction)
    end
  elsif /\ANOT ([a-z]+) -> ([a-z]+)/ =~ instruction
    if context[$1]
      context[$2] = ~context[$1]
      if context[$2] < 0
        context[$2] = 65536 + context[$2]
      end
    else
      instructions.unshift(instruction)
    end
  elsif /\A([a-z]+) LSHIFT (\d+) -> ([a-z]+)/ =~ instruction
    if context[$1]
      context[$3] = context[$1] << $2.to_i
    else
      instructions.unshift(instruction)
    end
  elsif /\A([a-z]+) RSHIFT (\d+) -> ([a-z]+)/ =~ instruction
    if context[$1]
      context[$3] = context[$1] >> $2.to_i
    else
      instructions.unshift(instruction)
    end
  elsif /\A([a-z]+) AND ([a-z]+) -> ([a-z]+)/ =~ instruction
    if context[$1] && context[$2]
      context[$3] = context[$1] & context[$2]
    else
      instructions.unshift(instruction)
    end
  elsif /\A([a-z]+) OR ([a-z]+) -> ([a-z]+)/ =~ instruction
    if context[$1] && context[$2]
      context[$3] = context[$1] | context[$2]
    else
      instructions.unshift(instruction)
    end
  elsif /\A(\d+) OR ([a-z]+) -> ([a-z]+)/ =~ instruction
    if context[$2]
      context[$3] = $1.to_i | context[$2]
    else
      instructions.unshift(instruction)
    end
  elsif /\A([a-z]+) OR (\d+) -> ([a-z]+)/ =~ instruction
    if context[$1]
      context[$3] = $2.to_i | context[$1]
    else
      instructions.unshift(instruction)
    end
  elsif /\A([a-z]+) AND (\d+) -> ([a-z]+)/ =~ instruction
    if context[$1]
      context[$3] = $2.to_i & context[$1]
    else
      instructions.unshift(instruction)
    end
  elsif /\A(\d+) AND ([a-z]+) -> ([a-z]+)/ =~ instruction
    if context[$2]
      context[$3] = $1.to_i & context[$2]
    else
      instructions.unshift(instruction)
    end
  else
    fail "WTF? #{instruction}"
  end
end

binding.pry

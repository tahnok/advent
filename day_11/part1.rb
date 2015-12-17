password = "cqjxxyzz"

loop do
  password = password.succ
  next if password =~ /(i|o|l)/

  next unless password.chars.each_cons(3).map {|a,b,c| a.succ == b && b.succ == c }.any?

  next unless password =~ /(\w)\1.*(\w)\2/ && $1 != $2

  break
end

puts password

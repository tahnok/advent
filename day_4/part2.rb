require 'digest'

SECRET = "iwrupvqb"

number = 0

loop do
  hash = Digest::MD5.hexdigest("#{SECRET}#{number}")
  if /\A0{6,}/ =~ hash
    puts number
    puts hash
    exit
  else
    number += 1
  end
end

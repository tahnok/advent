require 'json'
require 'pry'

def sum(obj)
  case obj
  when Fixnum
    obj
  when String
    0
  when Array
    obj.map{|x| sum(x)}.inject(&:+)
  when Hash
    if obj.values.any?{|x| x == "red"}
      0
    else
      obj.map{|x| sum(x)}.inject(&:+)
    end
  else
    fail "wtf #{obj}"
  end
end

thang = JSON.parse(File.read('input.txt'))
puts sum(thang)


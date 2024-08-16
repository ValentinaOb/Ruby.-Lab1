# n = 12
# ba = [3, 6, 11, 5, 6, 7, 6, 5 ]
# al = [10, 6, 9, 5, 6, 9, 5]

puts "\nInput n: " 
n=gets.chomp.to_i

ba=Array.new
al=Array.new
all=Array.new
both=Array.new
all_cl=Array.new
not_visited=Array.new

puts "\nInput ba: " 

loop do
  element = gets.chomp
  break if element == 'end'
  ba.push(element.to_i)
end

#for i in (0..n)
#  ba[i]=gets.chomp.to_i
#end

puts "\nInput al: " 
loop do
  element = gets.chomp
  break if element == 'end'
  al.push(element.to_i)
end

#for i in (0..n)
#  al[i]=gets.chomp.to_i
#end
for i in (0..ba.count-1)
  all.push(ba[i])
end
for i in (0..al.count-1)
    all.push(al[i])
end

puts "\n  Al: #{al} \n  Count: #{al.count}"
puts "\n  BA: #{ba} \n  Count: #{ba.count}"
puts "\n  All: #{all} \n  Count: #{all.count}"

puts "\n  Client: #{all.uniq} \n  Count: #{all.uniq.count}"

puts "\n  BA Count: #{ba.count}"
puts "\n  BA Client: #{ba.uniq} \n  BA Count: #{ba.uniq.count}"

puts "\n  AL Count: #{al.count}"
puts "\n  AL Client: #{al.uniq} \n  BA Count: #{al.uniq.count}"


for i in (0..ba.count-1)
  for j in (0..al.count-1)
    if(ba[i]==al[j])
      both.push(ba[i])
    end
  end
end
puts "\n  Both Client: #{both.uniq} \n  Both Count: #{both.uniq.count}"

all_cl=all.uniq
#puts "\n  Elem: #{all_cl} \n "
for i in (1..n)
  #puts "\n  I: #{i} \n  Res: #{all_cl.include?(i)}"
  if all_cl.include?(i)==false
    not_visited.push(i)
  end
  #puts "\n  Not: #{not_visited} \n"
end

puts "\n  Not_visited: #{not_visited.uniq} \n  Not_visited Count: #{not_visited.uniq.count}"

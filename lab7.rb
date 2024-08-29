def sum()
  value1=yield
  value2=yield
  value3=yield
  if(value1<0)
    value1=value1*value1
  end
  if(value2<0)
    value2=value2*value2
  end
  if(value3<0)
    value3=value3*value3
  end
  print("V1: ",value1,"\n")
  print("V2: ",value2,"\n")
  print("V3: ",value3,"\n")
  result=value1+value2+value3
  print("Result:", result,"\n\n")
end

sum do 
  [4,0,-12].sample
end

def check_password(a1, b1)
  Proc.new do |a, b|
    a == a1 && b == b1
  end
end

#sum()

'
puts "\nInput True pas1: " 
password=gets.chomp.to_s
puts "\nInput True pas2: " 
password1=gets.chomp.to_s

puts "\nInput password1: " 
ps=gets.chomp.to_s
puts "\nInput password2: " 
ps1=gets.chomp.to_s

admin=check_password(password,password1)
'

admin=check_password("u1","p1")
puts ("u1, p1: #{admin.call("u1","p1")}")
puts "u: #{admin.call("u")}"
puts "u1: #{admin.call("u1")}"


#puts "#{ps}, #{ps1}: #{admin.call(ps,ps1)}"
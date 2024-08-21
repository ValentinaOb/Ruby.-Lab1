# flat = cost + placement + profit + tax 
# cost = area * mat_index
#     mat_index: 
#               300(concrete);
#               500 (brick);
#               800(composite)

# placement = cost * floor * district
#     floor: 
#               1.1 ( 1,2, & 8,9,… )
#               1.4 ( 3..7 )
#     district: 
#               1.7 ( centre )
#               1.4 ( bedroom )
#               1.15 ( suburban )

# profit = placement * architecture
#     architecture: 
#               2 ( hightech )
#               1.7 ( exclusives )
#               1.5 ( individual )
#               1.05 ( standard )

# tax = profit * ktg
#     ktg: 
#               1.75 ( elite )
#               1.5 ( budget )
#               1.07 ( privileged )

# Input: footage  materials floor district style category
# Result: cost price (CP)   Developer's cost (DC)   Total cost (TC)

# 85, композит, 5, центр, стандарт, бюджетна

puts "\nInput footage: "  #area
footage=gets.chomp.to_i
puts "Input materials: "
materials=gets.chomp
puts "Input floor: "
floor=gets.chomp.to_i
puts "Input district: "
district=gets.chomp
puts "Input style: "  #architecture
style=gets.chomp
puts "Input category: "
category=gets.chomp

# cost = area * mat_index

if materials == "concrete"
  mat_index = 300
elsif materials == "brick"
  mat_index = 500
else
  mat_index = 800
end

#puts "\n  materials #{materials} \n mat_index: #{mat_index} \n}"

cost = footage * mat_index

# placement = cost * floor * district

#puts "\n  floor #{floor} \n district: #{district} \n}"
unless floor<=3 && floor>=7
  floor = 1.4
else floor = 1.1
end

case district
  when "centre"
    district = 1.7
  when "bedroom"
    district = 1.4
  when "suburban"
    district = 1.15
end
placement = cost * floor * district


#puts "\n  floor #{floor} \n district: #{district} \n}"
# profit = placement * architecture

case style
  when "hightech"
    architecture = 2
  when "exclusives"
    architecture = 1.7
  when "individual"
    architecture = 1.5
  when "standard"
    architecture = 1.05
end
profit = placement * architecture

#puts "\n  style #{style} \n architecture: #{architecture} \n}"

# tax = profit * ktg

if category == "elite"
  ktg = 1.75
elsif category == "budget"
  ktg = 1.5
else
  ktg = 1.07
end

tax = profit * ktg

#puts "\n  category #{category} \n ktg: #{ktg} \n}"

#puts "\n  pr #{profit} \n tax: #{tax} \n A: #{profit + tax}"
# Result: cost price (CP)   Developer's cost (DC)   Total cost (TC)
puts "\n  CP: #{cost} \n DC: #{(profit + tax)} \n Total cost (TC): #{tax}"
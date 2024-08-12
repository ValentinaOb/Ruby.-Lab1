puts "\nInput pages: "
pages=gets.chomp.to_i
puts "Input circulation: "
circulation=gets.chomp.to_i

#instance = costs + profit + tax
#costs = editorial + printing

#editorial = royalties (24/page) + registration(30% * royalties) + typesetting (1.2/page) 
#printing = paper (0.16/page + 3*1) + colours (0.04/page) + depreciation (0.08/page)

#profit = 23% * costs
#tax = 30% * costs


royalties = 24*pages
editorial = royalties + 0.3*royalties + 1.2*pages
printing = 0.16*pages + 3*1 + 0.04*pages + 0.08*pages
costs = editorial + printing
profit = 0.23 * costs
tax = 0.3 * costs
instance = costs + profit + tax

puts "Royalties: #{royalties} \n Costs: #{costs} \n All Profit: #{(profit*circulation)} \n Tax: #{tax} \n Instance: #{instance} \n"

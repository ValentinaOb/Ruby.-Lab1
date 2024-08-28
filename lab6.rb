'''
Для заданого масиву рядків in вигляді goods - count створити хеш,
який буде містити як ключ назву товару, як значення - кількість цього товару. 
in випадку, якщо товар повторюється, то кількість сумувати.

Дано: [Milk-10, Milk-20, Sugar-10]
Результат: {:Milk => 30, :Sugar => 10}

Task2
Для заданого тексту в форматі csv, значення максимального балу, 
відхилень від максимального значення та мінімального порогу (in відсотках) створити hash in вигляді
top: <студенти, які набрали не менше, ніж задана кількість балів> 
middle: <студенти, які набрали необхідний мінімум, але не ввійшли в топ студентів> 
bottom: <студенти, які не набрали необхідної кількості балів>
Список студентів повинен бути відсортований по кількості набраних балів (від найбільшого до найменшого),
in випадку однакових балів сортування повинно бути за алфавітом по зростанню.

Дано: "Student1,70\ Student3,80\ Student2,80" 
Max = 100 
upper_bound = 10 
lower_bound = 15
Результат: {top: [] middle: [Student2, Student3, Student1] bottom: []}
'''

require 'csv'

#1

def one
  ar=[:milk, 10, :milk, 20, :sugar, 10]
  goods = Hash[*ar]

  goo=Hash.new(0)
  goods.each do |key, value|
    goo[key]+=value
  end
  puts goo

end

#2a
def two

  #CSV.read("text.csv")
  #table = CSV.parse(File.read("text.csv"), headers: true)
  ar = CSV.read("text.csv")
  puts ar[0]
  ar1=[]
  k=0
  for i in(0..ar.length-1)
    #ar1.append("#{ar[i][0]},#{ar[i][1]}")
    #ar1.append(ar[i][0], ar[i][1].to_i)
    ar1[k] = ar[i][0]
    ar1[k+1] = ar[i][1].to_i
    k+=2
  end

  puts "R : #{ar1[0]}"
  '''
  #Also work
  hash = Hash[*ar1.each_slice(2).to_a.flatten]
  puts "Q: #{hash["Student1"]}"
  '''

  new_hesh = Hash[*ar1]
  #puts "S: #{new_hesh["Student1"]}"
  puts "S: #{new_hesh}"

  #puts "Array: #{ar1}"


  #Max = 100 upper_bound = 10 lower_bound = 15
  puts "\nInput max: " 
  max=gets.chomp.to_i
  puts "Input upper_bound: " 
  upper_bound=gets.chomp.to_i
  puts "Input lower_bound: " 
  lower_bound=gets.chomp.to_i


  mark = Hash[]
  top = Hash[]
  upper = Hash[]
  lower = Hash[]

  hash = hash.sort_by { |_, value| -value }.to_h

  hash.each {|key, value| 
  if(value>=max)
    top[key]= value
  elsif(value>=upper_bound && value<max)
    upper[key]= value
  else
    lower[key]= value
  end
  }


  arr1=[]

  top = top.sort_by { |key, _| -key }.to_h

  top.each {|key, value| 
  arr1.push(key)
  }
  mark[:top] = arr1

  arr1=[]
  upper = upper.sort_by { |key, _| -key }.to_h
  upper.each {|key, value| 
  arr1.push(key)
  }
  mark[:upper] = arr1

  arr1=[]
  lower = lower.sort_by { |key, _| -key }.to_h
  lower.each {|key, value| 
  arr1.push(key)
  }
  mark[:lower] = arr1

  '''
  if(hash>=max)
    top[hash.key]= hash.value
  elsif(hash>=upper_bound && hash.value<max)
    upper[hash.key]= hash
  else
    lower[hash.key]= hash
  end
  
  if(hash.value>=max)
    top[hash.key]= hash.value
  elsif(hash.value>=upper_bound && hash.value<max)
    upper[hash.key]= hash.value
  else
    lower[hash.key]= hash.value
  end

  mark [:top]=top.key()
  mark [:upper]=upper.key()
  mark [:lower]=lower.key()
  '''

  puts "M: #{mark}"


  #sort_hash = new_hesh.sort_by { |_, value| -value }.to_h
  #sort_hash1 = new_hesh.sort_by { |key, _| -key }.to_h
  #puts "S: #{sort_hash}"
  #puts "S1: #{sort_hash1}"


end

one()
#two()

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
  ar=["milk 10", "milk 20","sugar 10"]
  result=Hash.new(0)

  ar.each do |i|
    key, value = i.split(' ')
    result[key.to_s]+=value.to_i
  end

  puts result

end

def two

  result=Hash.new(0)
  CSV.foreach('text.csv') do |row|
    key, value = row[0].to_s, row[1].to_i
    result[key] = value
  end
  #puts result
  

  result = result.sort_by{ |key, _| key }.to_h
  #puts result
  result = result.sort_by{ |_, value| -value }.to_h
  #puts result
  
  puts "\nInput max: " 
  max=gets.chomp.to_i
  puts "Input upper_bound: " 
  upper_bound=gets.chomp.to_i
  puts "Input lower_bound: " 
  lower_bound=gets.chomp.to_i


  top=Hash.new(0)
  middle=Hash.new(0)
  bottom=Hash.new(0)

  result.each do |key,value|
    if(value>=max)
      top[key]=value
    elsif(value<lower_bound)
      bottom[key]=value
    else
      middle[key]=value
    end
  end

  puts "Top: "
  puts top
  puts "Middle: "
  puts middle
  puts "Bottom: "
  puts bottom

end

#one()
two()

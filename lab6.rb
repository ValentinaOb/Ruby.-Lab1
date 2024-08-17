'''
Для заданого масиву рядків у вигляді goods - count створити хеш, який буде містити як ключ назву товару, як значення - кількість цього товару. У випадку, якщо товар повторюється, то кількість сумувати.

Дано: [Milk-10, Milk-20, Sugar-10]
Результат: {:Milk => 30, :Sugar => 10}

Task2
Для заданого тексту в форматі csv, значення максимального балу, відхилень від максимального значення та мінімального порогу (у відсотках) створити hash у вигляді
top: <студенти, які набрали не менше, ніж задана кількість балів> 
middle: <студенти, які набрали необхідний мінімум, але не ввійшли в топ студентів> 
bottom: <студенти, які не набрали необхідної кількості балів>
Список студентів повинен бути відсортований по кількості набраних балів (від найбільшого до найменшого), у випадку однакових балів сортування повинно бути за алфавітом по зростанню.

Дано: "Student1,70\ Student3,80\ Student2,80" 
Max = 100 
upper_bound = 10 
lower_bound = 15
Результат: {top: [] middle: [Student2, Student3, Student1] bottom: []}
'''


#1

goods = Hash["milk"=>10, "milk"=>20, "sugar"=>10]

#goods.each { |h| h.each { |k, v| hsh[k] += v } }
puts goods

'''
 {"milk"=>10, "milk"=>20, "sugar"=>10}
puts goods["milk"] 
'''
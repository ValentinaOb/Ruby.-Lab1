'''
Скласти програму з наступними діями:
Ввести текстовий рядок, у якому є англійські заголовні букви, англійські прописні букви та цифри. Слова у тексті розділені пробілами.
Визначити розмір рядка.
Визначити кількість заголовних букв, прописних букв та цифр у суцільному рядку.
Розбити текст на масив слів.
Впорядкувати масив слів за зростанням довжини. 
Перетворити кожне слово у заголовне (перша буква слова – заголовне, решта - прописні).

Відобразити слова, підозрілі на абревіатуру (містять і букви і цифри).

Створити новий текст, в якому слова першого тексту розміщені у порядку спадання довжини
'''

#puts "Input text: "
#text=gets.chomp

text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an 
unknown printer took a galley of type and scrambled it to make a type specimen book. It 
has survived not only five centuries, but also the leap into electronic typesetting, remaining
essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing
Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"

puts "Len text: #{text.length}"

small = text.scan(/[a-z]/)
big = text.scan(/[A-Z]/)
numb = text.scan(/[0-9]/)
puts "Count [a-z]: #{small.length}"
puts "Count [A-Z]: #{big.length}"
puts "Count [0-9]: #{numb.length}"

text_ar=text.split(" ")
puts "\nArray text: #{text_ar}"

text_ar=text_ar.sort_by {|x| x.length}
puts "\nSort array text: #{text_ar}"

for i in (0..text_ar.count-1)
  text_ar[i]=text_ar[i].gsub(/\w+/){ |w| w.capitalize }
end
puts "\nStyle array text: #{text_ar}"



ab_text=""
ab_text=text.scan(/[A-Z0-9]/)

'''
for i in (0..text_ar.count-1)
  ab_text+=text_ar[i].scan(pattern)
end
'''

puts "\nAbbreviation array text: #{ab_text}"

new_text=""
for i in (text_ar.count-1..0)
  new_text += text_ar[i]
end
puts "\nNew text: #{text_ar}"
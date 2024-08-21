'''
Скласти програму з наступними діями:
Ввести текстовий рядок, in якому є англійські заголовні букви, англійські прописні букви та цифри. Слова in тексті розділені пробілами.
Визначити розмір рядка.
Визначити кількість заголовних букв, прописних букв та цифр in суцільному рядку.
Розбити текст на масив слів.
Впорядкувати масив слів за зростанням довжини. 
Перетворити кожне слово in заголовне (перша буква слова & заголовне, решта - прописні).

Відобразити слова, підозрілі на абревіатуру (містять & букви & цифри).

Створити новий текст, в якому слова першого тексту розміщені in порядку спадання довжини
'''

#puts "Input text: "
#text=gets.chomp

text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an 
unknown printer took a galley of type and scrambled it to make a type specimen book. It Y14RTF 
has survived not only five centuries, but also the leap into electronic typesetting, remaining FRTG1 
essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing 
Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum "

puts "Len text: #{text.length}"

small = text.scan(/[a-z]/)
big = text.scan(/[A-Z]/)
numb = text.scan(/[0-9]/)
puts "Count [a-z]: #{small.length}"
puts "Count [A-Z]: #{big.length}"
puts "Count [0-9]: #{numb.length}"

s_letters=["a","b","c","d","e","q","w","r","t","y","u","i","o","p","s","f","g","h","j","k","l","z","x","c","v","b","n","m"]
b_letters=["A","B","C","D","E","Q","W","R","T","Y","U","I","O","P","S","F","G","H","J","K","L","Z","X","C","V","B","N","M"]
numbers=[0,1,2,3,4,5,6,7,8,9]

small1=0
big1=0
numb1=0
for i in (0..text.length)
  for j in (0..s_letters.count-1)
    if(text[i]==s_letters[j])
      #puts "#{i} - #{text[i]} - #{s_letters[j]}"
      small1+=1
      break
    end
  end
  for j in (0..b_letters.count-1)
    if (text[i]==b_letters[j])
      big1+=1   
    end
  end
  for j in (0..numbers.count-1)
    if (text[i]==numbers[j].to_s)
      numb1+=1
    end
  end
end

puts "1 Count [a-z]: #{small1}"
puts "1 Count [A-Z]: #{big1}"
puts "1 Count [0-9]: #{numb1}"



text_ar=text.split(" ")
puts "\nArray text: #{text_ar}"


#-------start
data=""
data1=[]
text_ar1=[]

for i in (0..text.length)
  if(text[i]!=" " && text[i]!="\n")   
    data1.append(text[i])
  elsif(text[i]!="\n")
    text_ar1.append(data1.join(""))
    data1=[]
  end
end
puts "\n1 Array text: #{text_ar1}"
#-------end


text_ar=text_ar.sort_by {|x| x.length}
puts "\nSort array text: #{text_ar}"


#-------start

def sorting(array, text_ar1)
  is_sorted = true

  while is_sorted
    is_sorted = false

    (array.size - 1).times do |i|
      if array[i] > array[i + 1]
        text_ar1[i],text_ar1[i+1]=text_ar1[i+1],text_ar1[i]
        array[i], array[i + 1] = array[i + 1], array[i]
        is_sorted = true
      end
    end
  end
  array
end

text_length=[]
for i in (0..text_ar1.count-1)
  text_length[i]=text_ar1[i].length
end


sorting(text_length, text_ar1)
#puts "\nLen: #{text_length}"
puts "\n1 Sort array text: #{text_ar1}"

#-------end


for i in (0..text_ar.count-1)
  text_ar[i]=text_ar[i].gsub(/\w+/){ |w| w.capitalize }
end
puts "\nStyle array text: #{text_ar}"

#-------start
for i in (0..text_ar1.count-1)
  #for i1 in (0..text_ar1[i].length)
  for j in (0..s_letters.count-1)

    if(text_ar1[i][0]==s_letters[j])
      text_ar1[i][0]=b_letters[j]
    end
  #end
end
end
puts "\n1 Style array text: #{text_ar1}"
#-------end

ab_text=[]
el=""

for i in (0..text_ar.count-1)
  ab_text += text_ar[i].scan(/\w+\d+\w*/)
end
puts "\nAbbreviation array text: #{ab_text}"

ab1_text=[]
#-------start
for i in (0..text_ar.length)
  big1=0
  numb1=0
  '''
  for j in (0..s_letters.count-1)
    if(text[i]==s_letters[j])
      small1+=1
      break
    end
  end
  '''

  for j in (0..b_letters.count-1)
    if (text_ar[i]==b_letters[j])
      big1+=1   
    end
  end
  for j in (0..numbers.count-1)
    if (text_ar[i]==numbers[j].to_s)
      numb1+=1
    end
  end
  if(big1!=0 && numb1!=0)
    ab1_text.append(text_ar[i])
  end
end
puts "\nAbbreviation array text: #{ab1_text}"

#-------end

  
'''
for i in (0..text_ar.count-1)
  ab_text+=text_ar[i].scan(pattern)
end
'''

# !!!


new_text=[]
k=0

for i in (text_ar.count-1..0)
  puts "\nt: #{new_text[k]}"
  puts "\nK: #{text_ar[i]}"
  new_text[k] = text_ar[i]
  k+=1
end
puts "\nNew text: #{new_text}"

new1_text=""
for i in (text_ar1.count-1..0)
  new1_text =new1_text+ text_ar1[i]
end
puts "\n1 New text: #{new1_text}"
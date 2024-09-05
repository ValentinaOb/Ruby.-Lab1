'
Task 1.  Створити клас Mark, який буде мати два атрибути для читання для предмету на оцінки: subject та value. 
Екземпляри цього класу повинні в консолі виводитися in вигляд <назва предмету> : <оцінка>. При створенні екземпляру 
цього класу задаємо два значення: предмет та оцінка.
Створити клас Student, який буде мати атрибут для читання marks - це перелік предметів з оцінками, що є in студента 
(масив обєктів класу Mark) та змінну name, яка ініціалізується в конструкторі при створенні екземпляру цього класу. 
In цьому класі створити два методи - перший метод exists?(subject_title) з перевіркою, чи предмет з назвою subject_title 
вже є in студента (відповідно буде повертати істинне or хибне значення), другий - add_mark(mark) - буде додавати до переліку 
предметів студента ще один, який задається як аргумент, якщо його ще немає в переліку. Екземпляр цього класу в консоль виводиться 
in вигляді <імя студента>:<mark1>, mark2>, де оцінки - це екземпляри класу Mark.

mark = Mark.new(C++, 5)
puts mark => C++ : 4
st = Student.new(First student)
st.add_mark(mark)
puts st => St 1, marks: [C++ : 5])
mark2 = Mark.new(C++, 3))
st.add(mark2)
puts st => St 1, marks: [C++ : 5])

Task 2. Створити клас RetakeStudent, який буде нащадком класу Student. 
Цей нащадок відрізняється тільки поведінкою методу add_mark - при 
додаванні оцінки in випадку, якщо такий предмет вже є, старе значення 
оцінки замінється на нове. mark = Mark.new(C++, 5) 
puts mark => C++ : 5 
mark2 = Mark.new(C++, 3))

ret = RetakeStudent.new(Oher student) 
ret.add_mark(mark) ret.add(mark2) 
puts ret => Other student, marks: [C++ : 3])

Task 3. Написати клас Pizza.
Кожна піцца буде характеризуватися своїм набором інгредієнтів, діагоналлю
та номером замовлення. Цей набір повинен зберігатися in змінній ingredients.
Кожній піцці при створенні дається унікальний номер, який зберігається in 
змінній number (для цього треба створити змінну класу count, в яку 
записувати кількість створених екземплярів in використати її для цього 
номеру).
Діагональ зберігається in змінній d. Діагональ піцци може біти тільки 25 or 50. 
Якщо діагональ не дорівнює одному з цих значень, то піцца не створюється. Список 
інгредієнтів має бути порожнім. Номер піци дорівнювати нулю. Діагональ також 
дорівнює нулю.
Написати метод класу failInstance, який би повертав кількість невдалих спроб 
створення екземпляів класу Pizza (тих, в яких діагональ не дорівнює 25 or 50).

pizza1 = Pizza.new(10, [mushroom, cheese]) 
pizza2 = Pizza.new 25, [mushroom, cheese, cherry] 
pizza3 = Pizza.new 50, [mushroom] 
pizza4 = Pizza.new 100, [mushroom, cheese, cherry] 
puts Pizza.failInstance => 2

Task 4. Створити клас Author. Кожен Author визначається трьома атрибутами - 
прізвищем, імям, по-батькові. Прізвище та імя при створенні обовязкові. 
In атрибутах допускаються тільки букви будь-якого алфавіту та тире, довжина 
кожного атрибуту не повинна бути більше 15 символів. In класі Author in масиві 
authors будуть зберігатися всі створені автори. Автори не повторюються в цьому 
списку.

Написати клас Book. Кожен Book буде характеризуватися списком авторів 
(кожен автор - екземпляр класу Author), назваю, виданням та роком видання. 
Автори не можуть повторюватися для однієї книги. In назві книги та видавництві 
допускаються тільки букви будь-якого алфавіту, тире, крапка, кома, крапка з комою, 
цифри. Рік видання складається з чотирьох цифр and не може бути більшим за поточний. 
Якщо хоча b одна вимога не виконується при створенні екземпляру класу, то всі 
атрибути дорівнюють nil
'

class Mark
  attr_reader :subject, :value

  def initialize(subject, value)
    @subject = subject
    @value = value
  end

  def inf
    puts "#{subject}: #{value}"
  end
end

class Student
  attr_reader :marks, :name

  def initialize(name)
    @name = name
    @marks = []
  end

  def exists?(subject_title)
    @marks.any? { |mark| mark.subject == subject_title }
  end

  def add_mark(mark)
    @marks << mark unless exists?(mark.subject)
  end

  def inf
    puts "\n#{name}: [#{marks.each{|i| i.inf}}]"
    #puts "\n#{name}: [#{marks.each { |i| puts "#{i.subject}, #{i.value}" }}]"
  end
end

class RetakeStudent < Student
  def add_mark(mark)
    marks.each{|i|
    if(i.subject == mark.subject)
      marks.delete(i)
    end}
    
    @marks << mark
  end
end

class Pizza
  attr_reader :ingredients, :d
  @@numb=0
  @@fail=0
  @ingredients=[]
  @@pizzas=[]

  def initialize(d,*ingredients)
    if [25, 50].include?(d)
      @d=d
      @ingredients=ingredients
      @@numb+=1
      @@pizzas.push("Pizza#{@@numb}: #{ingredients}, #{d})")
    else
      @@fail+=1
    end
  end

  def self.failInstance
    puts "failInstance: #{@@fail}"
  end

  def self.inf
    puts @@pizzas
    puts "Failures: #{@@fail}"
  end
end

class Author
  attr_reader :surname, :name, :father
  @@authors=[]

  def initialize(surname, name, father = nil)
    #puts "V1: #{validate(surname)}, \nV2: #{validate(name)}\n"
    if validate(surname) && validate(name) && (father.nil? || validate(father))
      #puts "#{surname}, #{name}, #{father}"
      @surname = surname
      @name = name
      @father = father
      add_author(self)
    else
      @surname = @name = @father = nil
    end
  end

  def self.inf
    puts @@authors.each{|a| puts"#{a.surname} #{a.name} #{a.father}"}
  end

  def validate(str)
    str.match?(/[\wа-яА-Я]{1,15}/)
  end

  def add_author(author)
    #@@authors.any?{|a|puts "R: #{a.surname}, #{author.surname}"}
    @@authors << author unless @@authors.any? { |a| a.surname == author.surname}
  end

end

class Book
  attr_reader :name, :publication, :year, :authors
  @@books=[]

  def initialize(name, publication, year, *author)
    #puts "V1: #{validate_name(name)}, V2: #{validate_name(publication)}, V3: #{validate_year(year)}\n"
    if (validate_author(*author) && validate_name(name) && validate_name(publication) && validate_year(year))
      puts "#{name}, #{publication}, #{year}"
      @name = name
      @publication = publication
      @year = year
      @author = author
      add_book(self)
    else
      @name = @publication = @year = @author = nil
    end
  end

  def self.inf
    puts @@books.each{|a| puts"#{a.name}, #{a.publication}, #{a.year}, #{@@author}"}
  end

  def validate_author(*str)
    str.length==str.uniq.length
  end
  def validate_name(str)
    #str.match?(/\wА-ЯА-я\d/)
    str.match?(/\A[a-zA-Zа-яА-Я0-9.,;-]+\z/) || str.match?(' ')
  end
  def validate_year(str)
    str.to_s.match?(/\d{4}/) && (str<Time.now.year)
  end

  def add_book(books)
    @@books << books unless @@books.any? { |a| a.name == books.name}
  end

end



def one
  mark = Mark.new("C++", 5)
  st = Student.new("First student")
  st.add_mark(mark)
  mark = Mark.new("C++", 3)
  st.add_mark(mark)
  mark = Mark.new("OOP", 3)
  st.add_mark(mark)

  puts "C++: #{st.exists?("C++")}"
  puts "Java: #{st.exists?("Java")}"
  st.inf
end

def two
  mark = Mark.new("C++", 5)
  ret = RetakeStudent.new("Other student")
  ret.add_mark(mark)
  mark = Mark.new("C++", 3)
  ret.add_mark(mark)
  mark = Mark.new("OOP", 4)
  ret.add_mark(mark)

  ret.inf
end

def three
  pizza1 = Pizza.new(10, 'mushroom', 'cheese') 
  pizza2 = Pizza.new(25, 'mushroom', 'cheese', 'cherry')
  pizza3 = Pizza.new(50, 'mushroom')
  pizza4 = Pizza.new(100, 'mushroom', 'cheese', 'cherry')
  puts Pizza.failInstance
  Pizza.inf
end

def four
  author1 = Author.new('Шевченко', 'Тарас', 'Григорович') 
  author2 = Author.new('Shakespeare', 'William')
  author3 = Author.new('King', 'Stephen')
  author4 = Author.new('King', 'St')

  book1 = Book.new("Сон", "Видавництво-1", 1844, author1, author1) 
  book2 = Book.new("Сон", "Видавництво", 1844, author1) 
  book3 = Book.new("Every Man in His Humour", "Publi-cation", 1616, author2)
  book4 = Book.new("If It Bleeds", "Pub.lication", 2020, author3) 
  book4 = Book.new("New", "Publication", 2025, author3) 
  
  puts "\n"
  Author.inf
  puts "\n"
  Book.inf

end

four

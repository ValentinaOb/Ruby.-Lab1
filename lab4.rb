'''
Скласти програму, яка у фрагменті С/С++ програми (програма задається масивом рядків)
у всіх директивах препроцесора замінити символ «#» на «_», а прописні символи – на заголовні. 
Перетворення текстів здійснюється регулярними виразами.
'''

c=["int main()",
"{",
"#comment",
"   int n, m;",
"   cout << Input m, n: ;",
"#comment1",
"#comment2",
"   cin >> m >> n;",
"   cout << Den: << cor(n) << endl;",
"   cout << Num: << num(m) << endl;",
"   cout << Res: << num(m)/cor(n) << endl;",
"   return 0;",
"}"]

puts "\nC: #{c} \n"

for i in (0..c.count-1)
  c[i]=c[i].gsub(/#/, "_")
end

'''
h = {"#" => "_"}
for i in (0..c.count-1)
  c[i].gsub(/\w+/) { |m| h.fetch(m,m)}
end

for i in (0..c.count-1)
  c[i]=c[i].gsub(/[a-z]/, /[A-Z]/)
end
'''
#puts "#{"#comment1".gsub(/#/, "_")}"

puts "\nC #: #{c} \n"
for i in (0..c.count-1)
  c[i]=c[i].gsub(/\w/){ |w| w.capitalize }
end

puts "\nC A-Z: #{c} \n"

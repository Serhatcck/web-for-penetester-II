a = Time.now.to_i #place your current linux time stamp
s = Random.new(a)
passad = 6.times.map { ('a'..'z').to_a[s.rand(('a'..'z').to_a.size)]}.join
passhk = 6.times.map { ('a'..'z').to_a[s.rand(('a'..'z').to_a.size)]}.join

puts "insert the password for the hacker login:"
pass_hk = gets.chomp

while passhk != pass_hk do #şuanki time dan tek tek geriye gidiyor ve şifreleri tekrar hesaplıyor
a = a - 1
s = Random.new(a)
passad = 6.times.map { ('a'..'z').to_a[s.rand(('a'..'z').to_a.size)]}.join
passhk = 6.times.map { ('a'..'z').to_a[s.rand(('a'..'z').to_a.size)]}.join
puts a
end
puts "admin pass is :"
puts passad
puts "done :-)"

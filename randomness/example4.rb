"""
s = Random.new(0)
rand(1000).times {s.rand(5)}
pass = 6.times.map { ('a'..'z').to_a[s.rand(('a'..'z').to_a.size)]}.join
User.create(:username => 'admin', :password => Digest::MD5.hexdigest(SEED+pass+SEED))
pass = 6.times.map { ('a'..'z').to_a[s.rand(('a'..'z').to_a.size)]}.join
User.create(:username => 'hacker', :password => Digest::MD5.hexdigest(SEED+pass+SEED))
"""
a = 1000
s = Random.new(0)
a.times {s.rand(5)}
adminpass = 6.times.map { ('a'..'z').to_a[s.rand(('a'..'z').to_a.size)]}.join
hackerpass = 6.times.map { ('a'..'z').to_a[s.rand(('a'..'z').to_a.size)]}.join

#Önceden hesaplanan hacker şifresi
puts "hacker login password:"
hacker_pass = gets.chomp


while hackerpass != hacker_pass do
    a = a - 1
    s = Random.new(0)
    a.times {s.rand(5)}
    adminpass = 6.times.map { ('a'..'z').to_a[s.rand(('a'..'z').to_a.size)]}.join
    hackerpass = 6.times.map { ('a'..'z').to_a[s.rand(('a'..'z').to_a.size)]}.join
    puts a
end
puts "admin pass is :"
puts adminpass

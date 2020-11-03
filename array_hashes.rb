a = [1, 'cat', 3.14]

puts "The first element of a is #{a[0]}"
a[2] = nil
puts "The array is now #{a.inspect}"

a = ['ant', 'bee', 'cat', 'dog', 'elk']

a[0]
a[3]

# this is the same 
b = %w{ ant bee cat dog elk }

puts b[0]

puts b 
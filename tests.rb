require_relative 'enumerables.rb'

testing_array = [11, 15, 18, 54, 23, 46, 96, 85, 42, 10, 36, 52]
print 'Test array: ', testing_array
puts ''

puts 'Testing my_each: '
testing_array.my_each { |value| print value * 2, ' ' }
puts ''

puts 'Testing my_each with no block given: '
extra_array = testing_array.my_each
p extra_array
puts ''

puts 'Testing my_each_with_index: '
testing_array.my_each_with_index { |value, index| puts "Value: #{value}, Index: #{index}" }
puts ''

puts 'Testing my_each_with_index with no block given: '
extra_array = testing_array.my_each_with_index
p extra_array
puts ''

puts 'Testing my_select by selecting odd numbers: '
testing_array.my_select { |value| print "#{value} " if value.even? }
puts ''

puts 'Testing my_select with no block given: '
p testing_array.my_select
puts ''

bigger_than_thirty = proc { |num| num > 30 }

puts 'Testing my_all by checking if all numbers are greater than 30'
puts testing_array.my_all(&bigger_than_thirty)

puts 'Testing my_all by checking if all numbers have at least 1 digit'
puts testing_array.my_all(/\d/)

puts 'Testing my_all by checking if all elements are Integers'
puts testing_array.my_all(Integer)

puts 'Testing my_all by checking if all elements are 1'
puts testing_array.my_all(1)

puts 'Testing my_any by checking if any value is greater than 30'
puts testing_array.my_any(&bigger_than_thirty)

puts 'Testing my_any by checking if any value has at least 1 digit'
puts testing_array.my_any(/\d/)

puts 'Testing my_any by checking if any value is an integer'
puts testing_array.my_any(Integer)

puts 'Testing my_any by checking if any value is a 1'
puts testing_array.my_any(1)

puts 'Testing my_none by checking if none of the numbers are greater than 30'
puts testing_array.my_none(&bigger_than_thirty)

puts 'Testing my_none by checking if none of the elements has at least 1 digit'
puts testing_array.my_none(/\d/)

puts 'Testing my_none by checking if none of the elements is an integer'
puts testing_array.my_none(Integer)

puts 'Testing my_none by checking if none of the numbers are a 1'
puts testing_array.my_none(1)

puts 'Testing my_count without any block'
puts testing_array.my_count

puts 'Testing my_count by counting all the even numbers'
puts testing_array.my_count(&:even?)

puts 'Testing my_count by counting how many times 10 is repeated'
puts testing_array.my_count(10)

puts 'Testing my_map by printing a new array which multiplies every element by 3'
extra_array = testing_array.my_map { |value| value * 3 }
print extra_array
puts ''
puts 'Testing my_map by printing a new array which multiplies every element by 3'
p testing_array.my_map
puts ''

puts [1, 3, 5, 7, 9].inject(0) { |a, b| print "#{a}, #{b}" }

puts 'Testing multiply_els'
print multiply_els(testing_array)
puts ''

double = proc { |value| value * 2 }

puts 'Testing my_map with a proc the proc doubles the value'
extra_array = testing_array.my_map(&double)
print extra_array

module Enumerable
  def my_each
    for value in self do
      yield(value)
    end
  end

  def my_each_with_index
    i = 0
    for value in self do
      yield(value, i)
      i += 1
    end
  end

  def my_select
    new_array = []
    for value in self do
      new_array.push(value) if yield(value)
    end
    new_array
  end
end

testing_array = [11, 15, 18, 54, 23, 46, 96, 85, 42, 10, 36, 52]
print 'Test array: ', testing_array
puts ''
puts 'Testing my_each: '
testing_array.my_each { |value| print value * 2, ' ' }
puts ''

puts 'Testing my_each_with_index: '
testing_array.my_each_with_index { |value, index| puts "Value: #{value}, Index: #{index}" }
puts ''

puts 'Testing my_select by selecting odd numbers'
testing_array.my_select { |value| print "#{value} " if value.even? }
puts ''
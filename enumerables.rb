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

  def my_all?
    for value in self do
      flag = yield(value)
      break unless flag
    end
    flag
  end

  def my_any?
    for value in self do
      flag = yield(value)
      break if flag
    end
    flag
  end

  def my_none?
    for value in self do
      flag = yield(value)
      break if flag
  end
    !flag
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

bigger_than_thirty = proc { |num| num > 30 }

puts 'Testing my_all by checking if all numbers are greater than 30'
puts testing_array.my_all?(&bigger_than_thirty)

puts 'Testing my_any by checking if any value is greater than 30'
puts testing_array.my_any?(&bigger_than_thirty)

puts 'Testing my_none by checking if none of the numbers are greater than 30'
puts testing_array.my_none?(&bigger_than_thirty)
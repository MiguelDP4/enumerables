module Enumerable
  def my_each
    if block_given?
      for value in self do
        yield(value)
      end
    else
      to_enum(:my_each)
    end
  end

  def my_each_with_index
    if block_given?
      i = 0
      for value in self do
        yield(value, i)
        i += 1
      end
    else
      to_enum(:my_each_with_index)
    end
  end

  def my_select
    if block_given?
      new_array = []
      for value in self do
        new_array.push(value) if yield(value)
      end
      new_array
    else
      to_enum(:my_select)
    end
  end

  def my_all(argument = nil)
    if argument.nil? && !block_given?
      for value in self do
        matches = value.nil? || !value == true
        break if matches
      end
      !matches
    elsif argument.nil?
      for value in self do
        matches = yield(value)
        break unless matches
      end
      matches
    elsif argument.is_a?(Regexp)
      for value in self do
        matches = value.to_s.match?(argument)
        break unless matches
      end
      matches
    elsif argument.is_a?(Class)
      for value in self do
        matches = value.is_a?(argument)
        break unless matches
      end
      matches
    else
      for value in self do
        matches = value == argument
        break unless matches
      end
      matches
    end
  end

  def my_any(argument = nil)
    if argument.nil? && !block_given?
      for value in self do
        matches = value.nil? || !value == true
        break unless matches
      end
      !matches
    elsif argument.nil?
      for value in self do
        matches = yield(value)
        break if matches
      end
      matches
    elsif argument.is_a?(Regexp)
      for value in self do
        matches = value.to_s.match?(argument)
        break if matches
      end
      matches
    elsif argument.is_a?(Class)
      for value in self do
        matches = value.is_a?(argument)
        break if matches
      end
      matches
    else
      for value in self do
        matches = value == argument
        break if matches
      end
      matches
    end
  end

  def my_none(argument = nil)
    if argument.nil? && !block_given?
      for value in self do
        matches = value == true
        break if matches
      end
    elsif argument.nil?
      for value in self do
        matches = yield(value)
        break if matches
      end
    elsif argument.is_a?(Regexp)
      for value in self do
        matches = value.to_s.match?(argument)
        break if matches
      end
    elsif argument.is_a?(Class)
      for value in self do
        matches = value.is_a?(argument)
        break if matches
      end
    else
      for value in self do
        matches = value == argument
        break if matches
      end
    end
    !matches
  end

  def my_count(argument = nil)
    i = 0
    if argument.nil?
      if block_given?
        for value in self do
          i += 1 if yield(value)
        end
      else
        i = length
      end
    else
      for value in self do
        i += 1 if value == argument
      end
    end
    i
  end

  def my_map
    if block_given?
      new_array = []
      for value in self do
        new_array.push(yield(value))
      end
      new_array
    else
      to_enum(:my_map)
    end
  end

  def my_inject(argument1 = nil, argument2 = nil)
    if block_given?
      if argument1.nil?
        first = true
        for value in self do
          if first
            accumulator = value
            first = false
            next
          end
          accumulator = yield(accumulator, value)
        end
      else
        accumulator = argument1
        for value in self do
          accumulator = yield(accumulator, value)
        end
      end
    elsif argument2.nil?
      first = true
      case argument1
      when :+
        for value in self do
          if first
            accumulator = value
            first = false
            next
          end
          accumulator += value
        end
      when :-
        for value in self do
          if first
            accumulator = value
            first = false
            next
          end
          accumulator -= value
        end
      when :*
        for value in self do
          if first
            accumulator = value
            first = false
            next
          end
          accumulator *= value
        end
      when :/
        for value in self do
          if first
            accumulator = value
            first = false
            next
          end
          accumulator /= value
        end
      when :%
        for value in self do
          if first
            accumulator = value
            first = false
            next
          end
          accumulator = accumulator % value
        end
      when :**
        for value in self do
          if first
            accumulator = value
            first = false
            next
          end
          accumulator **= value
        end
      else
        puts 'Please insert a valid symbol'
      end
    else
      accumulator = argument1
      case argument2
      when :+
        for value in self do
          accumulator += value
        end
      when :-
        for value in self do
          accumulator -= value
        end
      when :*
        for value in self do
          accumulator *= value
        end
      when :/
        for value in self do
          accumulator /= value
        end
      when :%
        for value in self do
          accumulator = accumulator % value
        end
      when :**
        for value in self do
          accumulator **= value
        end
      else
        puts 'Please insert a valid symbol'
      end
    end
    accumulator
  end
end

def multiply_els(array)
  array.my_inject(:*)
end

require './enumerables.rb'

RSpec.describe Enumerable do
  describe '#my_each' do
    it 'Returns an enumerable if no block given' do
      array = [1, 2, 5, 8, 7, 98, 4]
      expect(array.my_each).to be_a(Enumerable)
    end

    it 'Returns original array if any block is given' do
      array = [1, 2, 5, 8, 7, 98, 4]
      expect(array.my_each { |element| element }).to eql(array)
    end
  end

  describe '#my_each_with_index' do
    it 'Returns an enumerable if no block given' do
      array = [1, 2, 5, 8, 7, 98, 4]
      expect(array.my_each_with_index).to be_a(Enumerable)
    end

    it 'Does block instructions on each element' do
      array = [1, 2, 5, 8, 7, 98, 4]
      expected_array = []
      array.my_each_with_index { |_value, index| expected_array[index] = array[index] + 1 }
      expect(expected_array).to eql([2, 3, 6, 9, 8, 99, 5])
    end
  end

  describe '#my_select' do
    it 'Filters the content of an array' do
      array = [1, 2, 5, 8, 7, 98, 4]
      expected_array = array.my_select(&:even?)
      expect(expected_array).to eql([2, 8, 98, 4])
    end

    it 'Returns enumerable if no block is provided' do
      array = [1, 2, 5, 8, 7, 98, 4]
      output = array.my_select
      expect(output).to be_a(Enumerable)
    end
  end

  describe '#my_all' do
    it 'Returns false if not all elements fill criteria' do
      array = [1, 2, 5, 8, 7, 98, 4]
      output = array.my_all(&:even?)
      expect(output).to eql(false)
    end

    it 'Returns true if all elements fill criteria' do
      array = [1, 2, 5, 8, 7, 98, 4]
      expected_array = array.my_all { |value| value > 0 }
      expect(expected_array).to eql(true)
    end

    it 'Returns true if no block is given and none of the elements are false or nil' do
      array = [1, 2, 5, 8, 7, 98, 4]
      expected_array = array.my_all
      expect(expected_array).to eql(true)
    end
  end

  describe '#my_any' do
    it 'Returns true if any of the elements fill criteria' do
      array = [1, 2, 5, 8, 7, 98, 4]
      output = array.my_any(&:even?)
      expect(output).to eql(true)
    end

    it 'Returns false if none of the elements fill criteria' do
      array = [1, 2, 5, 8, 7, 98, 4]
      expected_array = array.my_any { |value| value < 0 }
      expect(expected_array).to eql(false)
    end
  end

  describe '#my_none' do
    it 'Returns false if any of the elements fill criteria' do
      array = [1, 2, 5, 8, 7, 98, 4]
      output = array.my_none(&:even?)
      expect(output).to eql(false)
    end

    it 'Returns true if none of the elements fill criteria' do
      array = [1, 2, 5, 8, 7, 98, 4]
      expected_array = array.my_none { |value| value < 0 }
      expect(expected_array).to eql(true)
    end
  end

  describe '#my_count' do
    it 'Returns the size of the array if no block is given' do
      array = [1, 2, 5, 8, 7, 98, 4]
      expect(array.my_count).to eql(7)
    end
    it 'Returns how many elements comply with the block' do
      array = [1, 2, 5, 8, 7, 98, 4]
      output = array.my_count(&:even?)
      expect(output).to eql(4)
    end

    it 'Returns the number of elements equal to the argument if an argument is given' do
      array = [1, 2, 5, 8, 7, 98, 4]
      output = array.my_count(5)
      expect(output).to eql(1)
    end
  end

  describe '#my_map' do
    it 'Returns enumerator if no block given' do
      array = [1, 2, 5, 8, 7, 98, 4]
      expect(array.my_map).to be_a(Enumerator)
    end

    it 'Returns a modified array if block is given with instructions' do
      array = [1, 2, 5, 8, 7, 98, 4]
      output = array.my_map { |value| value * 2 }
      expect(output).to eql([2, 4, 10, 16, 14, 196, 8])
    end
  end
end

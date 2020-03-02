require './enumerables.rb'

RSpec.describe Enumerable do
  let(:array) { [1, 2, 5, 8, 7, 98, 4] }
  describe '#my_each' do
    it 'Returns an enumerable if no block given' do
      expect(array.my_each).to be_a(Enumerable)
    end

    it 'Returns an enumerable if no block given (negative)' do
      expect(array.my_each).not_to be_a(String)
    end

    it 'Returns original array if any block is given' do
      expect(array.my_each { |element| element }).to eql(array)
    end

    it 'Returns original array if any block is given (negative)' do
      expect(array.my_each { |element| element }).not_to eql(nil)
    end
  end

  describe '#my_each_with_index' do
    it 'Returns an enumerable if no block given' do
      expect(array.my_each_with_index).to be_a(Enumerable)
    end

    it 'Returns an enumerable if no block given (negative)' do
      expect(array.my_each_with_index).not_to be_a(String)
    end
    let(:expected_array) { [] }

    it 'Does block instructions on each element' do
      array.my_each_with_index { |_value, index| expected_array[index] = array[index] + 1 }
      expect(expected_array).to eql([2, 3, 6, 9, 8, 99, 5])
    end

    it 'Does block instructions on each element (negative)' do
      array.my_each_with_index { |_value, index| expected_array[index] = array[index] + 1 }
      expect(expected_array).not_to eql(array)
    end
  end

  describe '#my_select' do
    let(:expected_array) { array.my_select(&:even?) }

    it 'Filters the content of an array' do
      expect(expected_array).to eql([2, 8, 98, 4])
    end

    it 'Filters the content of an array (negative)' do
      expect(expected_array).not_to eql([])
    end

    let(:output) { array.my_select }

    it 'Returns enumerable if no block is provided' do
      expect(output).to be_a(Enumerable)
    end

    it 'Returns enumerable if no block is provided (negative)' do
      expect(output).not_to be_a(Integer)
    end
  end

  describe '#my_all' do
    let(:output) { array.my_all(&:even?) }

    it 'Returns false if not all elements fill criteria' do
      expect(output).to eql(false)
    end

    it 'Returns false if not all elements fill criteria (negative)' do
      expect(output).not_to eql(true)
    end

    let(:expected_array) { array.my_all { |value| value > 0 } }

    it 'Returns true if all elements fill criteria' do
      expect(expected_array).to eql(true)
    end

    it 'Returns true if all elements fill criteria (negative)' do
      expect(expected_array).not_to eql(false)
    end

    let(:expected_array) { array.my_all }

    it 'Returns true if no block is given and none of the elements are false or nil' do
      expect(expected_array).to eql(true)
    end

    it 'Returns true if no block is given and none of the elements are false or nil (negative)' do
      expect(expected_array).not_to eql(false)
    end
  end

  describe '#my_any' do
    let(:output) { array.my_any(&:even?) }

    it 'Returns true if any of the elements fill criteria' do
      expect(output).to eql(true)
    end

    it 'Returns true if any of the elements fill criteria (negative)' do
      expect(output).not_to eql(false)
    end

    let(:expected_array) { array.my_any { |value| value < 0 } }

    it 'Returns false if none of the elements fill criteria' do
      expect(expected_array).to eql(false)
    end

    it 'Returns false if none of the elements fill criteria (negative)' do
      expect(expected_array).not_to eql(true)
    end
  end

  describe '#my_none' do
    let(:output) { array.my_none(&:even?) }

    it 'Returns false if any of the elements fill criteria' do
      expect(output).to eql(false)
    end

    it 'Returns false if any of the elements fill criteria (negative)' do
      expect(output).not_to eql(true)
    end

    let(:expected_array) { array.my_none { |value| value < 0 } }

    it 'Returns true if none of the elements fill criteria' do
      expect(expected_array).to eql(true)
    end

    it 'Returns true if none of the elements fill criteria (negative)' do
      expect(expected_array).not_to eql(false)
    end
  end

  describe '#my_count' do
    it 'Returns the size of the array if no block is given' do
      expect(array.my_count).to eql(7)
    end

    it 'Returns the size of the array if no block is given (negative)' do
      expect(array.my_count).not_to eql(0)
    end

    it 'Returns how many elements comply with the block' do
      expect(array.my_count(&:even?)).to eql(4)
    end

    it 'Returns how many elements comply with the block (negative)' do
      expect(array.my_count(&:even?)).not_to eql(0)
    end

    it 'Returns the number of elements equal to the argument if an argument is given' do
      expect(array.my_count(5)).to eql(1)
    end

    it 'Returns the number of elements equal to the argument if an argument is given (negative)' do
      expect(array.my_count(5)).not_to eql(5)
    end
  end

  describe '#my_map' do
    it 'Returns enumerator if no block given' do
      expect(array.my_map).to be_a(Enumerator)
    end

    it 'Returns enumerator if no block given (negative)' do
      expect(array.my_map).not_to be_a(String)
    end

    it 'Returns a modified array if block is given with instructions' do
      expect(array.my_map { |value| value * 2 }).to eql([2, 4, 10, 16, 14, 196, 8])
    end

    it 'Returns a modified array if block is given with instructions (negative)' do
      expect(array.my_map { |value| value * 2 }).not_to eql(array)
    end
  end

  describe '#my_inject' do
    it 'Gets an initial number and a symbol and operates the array' do
      expect(array.inject(5, :+)).to eql(130)
    end

    it 'Gets an initial number and a symbol and operates the array (negative)' do
      expect(array.inject(5, :+)).not_to eql(10)
    end

    it 'Gets a symbol and uses it to operate' do
      expect(array.inject(:+)).to eql(125)
    end

    it 'Gets a symbol and uses it to operate (negative)' do
      expect(array.inject(:+)).not_to eql(200)
    end

    it 'Gets an initial number and operates with the block instructions' do
      expect(array.inject(5) { |acumulator, value| acumulator + value }).to eql(130)
    end

    it 'Gets an initial number and operates with the block instructions (negative)' do
      expect(array.inject(5) { |acumulator, value| acumulator + value }).not_to eql(150)
    end

    it 'Gets a symbol and uses it to operate' do
      expect(array.inject { |accumulator, value| accumulator + value }).to eql(125)
    end

    it 'Gets a symbol and uses it to operate (negative)' do
      expect(array.inject { |accumulator, value| accumulator + value }).not_to eql(200)
    end
  end
end

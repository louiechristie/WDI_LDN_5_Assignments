class Node
  attr_accessor :value # The value we're storing
  attr_accessor :next_node # The next node in the list, if any

  def initialize(new_value)
    @value = new_value
    @next_node = nil
  end
end


class LinkedList
  attr_reader :traversal_count, :length

  def initialize
    @head = nil
    @traversal_count = 0
    @length = 0
    @current_node_index = nil
    @current_node = nil
  end

  # def <<(value)
  #   node_to_be_added = Node.new(value)
  #   unless @head
  #     @head = node_to_be_added
  #   else
  #     current_node = @head
  #     while current_node.next_node
  #       current_node = current_node.next_node
  #     end
  #     current_node.next_node = node_to_be_added
  #   end
  # end

  def <<(new_value)
    node_to_be_added = Node.new(new_value)
    node_to_be_added.next_node = @head
    @head = node_to_be_added
    @length += 1
  end
  alias_method :add, :"<<"

  def show
    output = ""
    current_node = @head
    while current_node
      output += current_node.value.to_s
      output += " -> " if current_node.next_node
      current_node = current_node.next_node
      @traversal_count += 1
    end
    output
  end

  def get_node_at(index)
    if @current_node_index && @current_node_index >= index
      jumps = @current_node_index - index
      node = @current_node
    else
      jumps = self.length - 1 - index
      node = @head
    end

    jumps.times { node = node.next_node }
    @traversal_count += jumps
    @current_node = node
    @current_node_index = index

    node
  end

  def [](index)
    if index >= self.length
      nil
    else
      current_node = self.get_node_at(index)
      current_node.value
    end
  end

  def []=(index, new_value)
    if index >= self.length
      missing_node_count = index - self.length
      missing_node_count.times { self << nil }
      self << new_value
    else
      current_node = self.get_node_at(index)
      current_node.value = new_value
    end
  end

  def ==(comparison_list)
    if self.length != comparison_list.length
      return false
    else
      for i in (0..self.length)
        if self[i] != comparison_list[i]
          return false
        end
      end
      return true
    end
  end
end






require 'test/unit'
class TestLinkedList < Test::Unit::TestCase
  def setup
    @list = LinkedList.new
    @words = %w{foo bar baz rectangle america megaphone monday}
    @method = ""
  end

  def teardown
    puts "\nPerformed #{@list.traversal_count} traversals in #{@method}."
  end

  def test_add
    @method = 'test_add'
    assert_equal 0, @list.length
    count = 0
    @words.each do |w|
      @list << w
      count += 1
      assert_equal count, @list.length
    end
  end

  def test_indices 
    @method = 'test_indices'
    assert_equal 0, @list.length
    @words.each { |w| @list << w }
    assert_equal nil, @list[100]

    # Test up past the end of the words array to check boundary conditions. 
    for i in (0..@words.length)
      assert_equal @words[i], @list[i]
    end
  end

 def test_indices_assignment
    @method = 'test_indices_assignment'
    @words.each { |w| @list << w }
    assert_equal @words[3], @list[3]
    @list[3] = "avocado"
    assert_equal "avocado", @list[3]

    for i in (0..@words.length)
      unless 3 == i
        assert_equal @words[i], @list[i]
      end
    end
  end

  def test_extended_assignment
    @method = 'test_extended_assignment'
    @words.each { |w| @list << w }
    assert @list.length < 90

    @list[100] = 'avocado'
    assert_equal 101, @list.length, "Our list now has 100 elements"
    for index in (@words.length...100)
      assert_equal nil, @list[index]
    end
    assert_equal "avocado", @list[100]
  end

  def test_more_elements
    @method = 'test_more_elements'
    (0..1000).each {|n| @list << n }

    (0..1000).each {|n| assert_equal n, @list[n]}
  end

  def test_more_elements_backwards
    @method = 'test_more_elements_backwards'
    (0..1000).each {|n| @list << n }

    (0..1000).to_a.reverse.each {|n| assert_equal n, @list[n]}
  end

  def test_more_elements_randomly
    @method = 'test_more_elements_randomly'
    (0..1000).each {|n| @list << n }

    (0..1000).to_a.shuffle.each {|n| assert_equal n, @list[n]}
  end


end
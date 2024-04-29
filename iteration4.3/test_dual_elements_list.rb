require "test/unit"
require_relative 'double_linked_list'

module DualElementsListTester
  def setup
    @head_value = Random.rand(1000)
    @tail_value = Random.rand(1000)
    @list = DoubleLinkedList.new
  end

  def test_list_not_empty
    assert !@list.empty?
  end

  def test_size_is_two
    assert_equal 2, @list.size
  end

  def test_head_value
    assert_equal @head_value, @list.head
  end

  def test_tail_value
    assert_equal @tail_value, @list.tail
  end
end

class TestAddHeadAddHead < Test::Unit::TestCase
  include DualElementsListTester
  
  def setup
    super
    @list.add_head(@tail_value)
    @list.add_head(@head_value)
  end
end

class TestAddTailAddTail < Test::Unit::TestCase
  include DualElementsListTester
  
  def setup
    super
    @list.add_tail(@head_value)
    @list.add_tail(@tail_value)
  end
end

class TestAddHeadAddTail < Test::Unit::TestCase
  include DualElementsListTester
  
  def setup
    super
    @list.add_head(@head_value)
    @list.add_tail(@tail_value)
  end
end

class TestAddTailAddHead < Test::Unit::TestCase
  include DualElementsListTester
  
  def setup
    super
    @list.add_tail(@tail_value)
    @list.add_head(@head_value)
  end
end

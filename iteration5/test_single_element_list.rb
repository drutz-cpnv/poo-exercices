require "test/unit"
require_relative 'double_linked_list'

module SingleElementListTester
  def test_list_not_empty
    assert !@list.empty?
  end

  def test_size_is_one
    assert_equal 1, @list.size
  end

  def test_head_is_the_single_value
    assert_equal @the_single_value, @list.head
  end

  def test_tail_is_the_single_value
    assert_equal @the_single_value, @list.head
  end
end

class TestSingleAddHead < Test::Unit::TestCase
  include SingleElementListTester
  
  def setup
    @the_single_value = Random.rand(1000)
    @list = DoubleLinkedList.new
    @list.add_head(@the_single_value)
  end
end

class TestSingleAddTail < Test::Unit::TestCase
  include SingleElementListTester
  
  def setup
    @the_single_value = Random.rand(1000)
    @list = DoubleLinkedList.new
    @list.add_tail(@the_single_value)
  end
end

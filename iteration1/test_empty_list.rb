require "test/unit"
require_relative 'double_linked_list'

class TestEmptyList < Test::Unit::TestCase
  def setup
    @list = DoubleLinkedList.new
  end

  def test_empty_list_after_creation
    assert @list.empty?
  end

  def test_size_is_zero_after_creation
    assert_equal 0, @list.size
  end

  def test_cant_get_head_after_creation
    assert_raise(EmptyListError) { @list.head }
  end

  def test_cant_get_tail_after_creation
    assert_raise(EmptyListError) { @list.tail }
  end
end

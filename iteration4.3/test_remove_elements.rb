require "test/unit"
require_relative 'double_linked_list'

class TestRemoveElements < Test::Unit::TestCase
  def setup
    @list = DoubleLinkedList.new
    @list.add_tail(10)
    @list.add_tail(20)
    @list.add_tail(30)
  end

  def test_remove_from_head_until_empty_list
    assert_equal 3, @list.size

    assert_equal 10, @list.remove_head
    assert_equal 2, @list.size

    assert_equal 20, @list.remove_head
    assert_equal 1, @list.size

    assert_equal 30, @list.remove_head
    assert @list.empty?
  end

  def test_remove_from_tail_until_empty_list
    assert_equal 3, @list.size

    assert_equal 30, @list.remove_tail
    assert_equal 2, @list.size

    assert_equal 20, @list.remove_tail
    assert_equal 1, @list.size

    assert_equal 10, @list.remove_tail
    assert @list.empty?
  end

  def test_cant_remove_from_head_with_empty_list
    @list.remove_head
    @list.remove_head
    @list.remove_head
    assert_raise(EmptyListError) { @list.remove_head }
  end

  def test_cant_remove_from_tail_with_empty_list
    @list.remove_tail
    @list.remove_tail
    @list.remove_tail
    assert_raise(EmptyListError) { @list.remove_tail }
  end

  def test_head_and_tail_matches_after_remove_from_head_when_last_element
    @list.remove_head
    @list.remove_head
    assert_equal 30, @list.head
    assert_equal 30, @list.tail
  end
  
  def test_head_and_tail_matches_after_remove_from_tail_when_last_element
    @list.remove_tail
    @list.remove_tail
    assert_equal 10, @list.head
    assert_equal 10, @list.tail
  end

  def test_cant_get_head_or_tail_after_all_removed_from_head
    @list.remove_head
    @list.remove_head
    @list.remove_head
    assert_raise(EmptyListError) { @list.head }
    assert_raise(EmptyListError) { @list.tail }
  end

  def test_cant_get_head_or_tail_after_all_removed_from_tail
    @list.remove_tail
    @list.remove_tail
    @list.remove_tail
    assert_raise(EmptyListError) { @list.head }
    assert_raise(EmptyListError) { @list.tail }
  end
end

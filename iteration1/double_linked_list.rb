class EmptyListError < StandardError
end

class DoubleLinkedList
  class Node
    attr_accessor :value, :prev, :next
    
    def initialize(value, prev, next_node)
      @value, @prev, @next = value, prev, next_node
    end
  end
  
  attr_reader :size
  
  def initialize
    @size = 0
  end
  
  def empty?
    @size == 0
  end
  
  def head
    raise EmptyListError unless @head
    @head.value
  end
  
  def tail
    raise EmptyListError unless @tail
    @tail.value
  end
  
  def each
    cursor = @head
    while cursor
      yield cursor.value
      cursor = cursor.next
    end
  end
  
end

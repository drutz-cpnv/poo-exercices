class EmptyListError < StandardError
end

class DoubleLinkedList
  class Node
    attr_accessor :value, :prev, :next

    def initialize(value, prev, next_node)
      @value = value
      @prev = prev
      @next = next_node
    end
  end

  attr_reader :size

  def initialize
    @size = 0
  end

  def empty?
    @size.zero?
  end

  def head
    raise EmptyListError unless @head

    @head.value
  end

  def tail
    raise EmptyListError unless @tail

    @tail.value
  end

  def add_head(value)
    if @head
      @head = Node.new(value, nil, @head)
      @head.next.prev = @head
    else
      @head = @tail = Node.new(value, nil, nil)
    end
    @size += 1
  end

  def add_tail(value)
    if @tail
      @tail = Node.new(value, @tail, nil)
      @tail.prev.next = @tail
    else
      @head = @tail = Node.new(value, nil, nil)
    end
    @size += 1
  end

  def remove_head
    raise EmptyListError unless @head

    node = @head
    @head = node.next
    if @head
      @head.prev = nil
    else
      @tail = nil
    end

    @size -= 1
    node.value
  end

  def remove_tail
    raise EmptyListError unless @tail

    node = @tail
    @tail = node.prev
    if @tail
      @tail.next = nil
    else
      @head = nil
    end

    @size -= 1
    node.value
  end

  def each
    cursor = @head
    while cursor
      yield cursor.value
      cursor = cursor.next
    end
  end

  def reverse_each
    cursor = @tail
    while cursor
      yield cursor.value
      cursor = cursor.prev
    end
  end
end

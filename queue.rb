# frozen_string_literal: true
require_relative 'double_linked_list'

class Queue
  def enqueue(item) end

  def dequeue() end

  def size() end

  def empty?() end

  class ArrayQueue < self

    def initialize
      super
      @array = []
    end

    def enqueue(item)
      @array.unshift(item)
    end

    def dequeue
      @array.pop
    end

    def empty?
      @array.empty?
    end

    def size
      @array.size
    end

  end

  class ListQueue < self

    def initialize
      super
      @list = DoubleLinkedList.new
    end

    def enqueue(item)
      @list.add_head(item)
    end

    def dequeue
      @list.remove_tail
    end

    def empty?
      @list.empty?
    end

    def size
      @list.size
    end

  end

end

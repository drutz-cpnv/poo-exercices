# frozen_string_literal: true

class Node

  attr_accessor :is_word
  def initialize(is_word = true)
    @children = []
    @is_word = is_word
  end

  def init
    @children = ('a'..'z').map { |_c| Node.new(false)}
    #@children = ('a'..'z').reduce({}) { |h, c| h[c] = Node.new(false); h}
  end
  def insert(letter, is_word = false)
    init if @children.empty?
    @children[letter].init
    @children[letter].is_word = is_word
  end

  def word?
    @is_word
  end

  def get_letter_node(letter)
    @children[letter]
  end

  def empty?
    @children.empty?
  end

end

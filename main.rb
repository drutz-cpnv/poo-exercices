# frozen_string_literal: true
require_relative 'node'

BASE = 'a'.ord

class WordSearchTree

  def initialize
    @root = Node.new
    @root.init
    @tb = []
  end

  def insert(word)
    current_node = @root
    @tb.push(word.strip)

    word.each_char do |char|
      next if char == "\n"
      index = char.ord - BASE
      # current_node = current_node.get_letter_node(char)
      # current_node.insert(char)
      current_node = current_node.get_letter_node(index)
      current_node.insert(index)
    end
    current_node.is_word = true

  end

  def search(word)
    current_node = @root
    word.each_char do |char|
      index = char.ord - BASE
      current_node = current_node.get_letter_node(index)
      # current_node = current_node.get_letter_node(char)
      if current_node.is_word
        return true
      end
      if current_node.empty?
        break
      end
    end
    current_node.word?
  end

  def search_tb(word)
    !@tb.select { |w| word === w }.empty?
  end

end

search = WordSearchTree.new

File.open('functions.txt').each do |line|
  search.insert(line)
end

p search.search("hashforediteisrbacroleassignmentpath")
p search.search_tb("hashforediteisrbacroleassignmentpath")
p search.search("helloworld")
p search.search_tb("helloworld")
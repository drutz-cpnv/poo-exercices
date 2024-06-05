#
# POO2: Ex3
# Pascal Hurni May 2020
# 

require_relative 'word_search_tree'

class VisitableWordSearchTree < WordSearchTree
  class Node < WordSearchTree::Node
    def visit(memo, &block)
      @children.each_with_index do |child, index|
        sub_memo = block.call(self, memo, child, index)
        child.visit(sub_memo, &block) if child
      end
    end
  end
  
  def initialize
    @root = Node.new
  end
  
  def visit(memo = nil, &block)
    @root.visit(memo, &block)
  end
end

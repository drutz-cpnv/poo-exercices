#
# POO2: Ex3
# Pascal Hurni May 2016
# 

require './word_search_tree'

# Insert them in the tree
functions_tree = WordSearchTree.new

# Interact with the user
loop do
  print "Please, type a function name: "
  name = gets.chomp
  break if name.empty?
  puts functions_tree.include?(name) ? 'Yes, this is a valid one' : 'Sorry, not found'
end

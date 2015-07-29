require_relative 'btree.rb'

array = [7, 4, 9, 1, 6, 14, 10]

bt = BinaryTree.new

array.each do |value|
	bt.insert(value)
end

@a = []
bt.dfs_recur(bt.head, @a)
puts "recur - #{@a.inspect}"

puts "inorder - #{bt.inorder(bt.head)}"


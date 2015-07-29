class BinaryTree
	attr_accessor :head

  class Node
    attr_accessor :payload, :left, :right

    def initialize(payload, left, right)
      @payload = payload
      @left = left
      @right = right
    end
  end

	# insert locates position of next node 
  def insert(payload)

		# handle base case if there's nothing
		if @head.nil?
		 @head = Node.new(payload, nil, nil)
		 return
		end

    current_node = @head

    loop do
      if payload > current_node.payload
        if current_node.right.nil?
          current_node.right = Node.new(payload, nil, nil)
          break
        else
          current_node = current_node.right
        end
      else
        # node payload is less than current_node's payload, so insert to left
        if current_node.left.nil?
          current_node.left = Node.new(payload, nil, nil)
          break
        else
          current_node = current_node.left
        end     
      end
    end
      
	end

	# traverses tree in dfs order
	def dfs_recur(node, array=[])
		return if node.nil?
    dfs_recur(node.left, array)
		array << node.payload
		dfs_recur(node.right, array)
	end

	def inorder(node)
		current_node = node
    traverse = []

		sorted = []

		loop do
			if !current_node.nil?
				traverse << current_node
				current_node = current_node.left
			else
				if !traverse.empty?
					current_node = traverse.pop
					sorted << current_node.payload
					current_node = current_node.right
				else
					break
				end
			end
		end
		return sorted
	end

	# preorder traversal
	def preorder(node)
		traverse = []
		traverse << node

    loop do
      break if traverse.empty?
			current_node = traverse.last
 			puts "current_node - #{traverse.pop.payload}"
			traverse << current_node.right if !current_node.right.nil?
			traverse << current_node.left if !current_node.left.nil?
		end

	end
end


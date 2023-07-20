require_relative  'node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def add(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next_node until current.next_node.nil?
      current.next_node = new_node
    end
  end

  def append(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next_node until current.next_node.nil?
      current.next_node = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  def size
    count = 0
    current = @head
    while !current.nil?
      count += 1
      current = current.next_node
    end
    count
  end


  def head
    @head
  end

  def tail
    return nil if @head.nil?

    current = @head
    current = current.next_node until current.next_node.nil?
    current
  end

  def at(index)
    return nil if @head.nil? || index < 0

    current = @head
    i = 0

    while i < index && !current.nil?
      current = current.next_node
      i += 1
    end

    current
  end

  def pop
    return nil if @head.nil?

    if @head.next_node.nil?
      value = @head.value
      @head = nil
      return value
    end

    current = @head
    previous = nil

    while !current.next_node.nil?
      previous = current
      current = current.next_node
    end

    value = current.value
    previous.next_node = nil
    value
  end

  def contains?(value)
    current = @head
    while !current.nil?
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  def find(value)
    current = @head
    index = 0
    while !current.nil?
      return index if current.value == value
      current = current.next_node
      index += 1
    end
    nil
  end

  def to_s
    return 'nil' if @head.nil?

    current = @head
    result = ''
    while current
      result += "( #{current.value} ) -> "
      current = current.next_node
    end
    result += 'nil'
    result
  end

  def insert_at(value, index)
    return prepend(value) if index.zero?

    new_node = Node.new(value)
    current = @head
    previous = nil
    i = 0

    while i < index && !current.nil?
      previous = current
      current = current.next_node
      i += 1
    end

    if current.nil? && i == index
      # Append the new node at the end of the list
      previous.next_node = new_node
    elsif i == index
      previous.next_node = new_node
      new_node.next_node = current
    else
      puts "Invalid index. Node at index #{index} does not exist."
    end
  end

  def remove_at(index)
    return if @head.nil? || index < 0

    if index.zero?
      @head = @head.next_node
      return
    end

    current = @head
    previous = nil
    i = 0

    while i < index && !current.nil?
      previous = current
      current = current.next_node
      i += 1
    end

    return if current.nil?

    if current.next_node.nil?
      # If the last element is being removed, update the tail.
      previous.next_node = nil
    else
      previous.next_node = current.next_node
    end
  end
end

list = LinkedList.new
list.append(1)
list.append(2)
list.prepend(0)

puts "Size: #{list.size}"
puts "Head: #{list.head.value}"
puts "Tail: #{list.tail.value}"

puts "Enter the index to retrieve the node value:"
index = gets.chomp.to_i

node = list.at(index)
if node.nil?
  puts "Node at index #{index} does not exist."
else
  puts "Node at index #{index}: #{node.value}"
end

popped_value = list.pop
puts "Popped Value: #{popped_value}"

puts "Enter a value to check if it is in the list:"
value_to_find = gets.chomp.to_i
if list.contains?(value_to_find)
  puts "#{value_to_find} is in the list."
else
  puts "#{value_to_find} is not in the list."
end

puts "Enter a value to find its index:"
value_to_search = gets.chomp.to_i
index = list.find(value_to_search)
if index.nil?
  puts "#{value_to_search} is not found in the list."
else
  puts "#{value_to_search} is at index #{index}."
end

puts "Linked List representation: #{list}"

puts "Enter a value to insert in the list:"
value_to_insert = gets.chomp.to_i
puts "Enter the index to insert the value:"
index_to_insert = gets.chomp.to_i
list.insert_at(value_to_insert, index_to_insert)
puts "Updated Linked List: #{list}"

puts "Enter the index to remove a node from the list:"
index_to_remove = gets.chomp.to_i
list.remove_at(index_to_remove)
puts "Updated Linked List: #{list}"

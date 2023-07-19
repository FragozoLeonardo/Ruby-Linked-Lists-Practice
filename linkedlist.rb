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

  def display
    current = @head
    while !current.nil?
      puts current.value
      current = current.next_node
    end
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
end

list = LinkedList.new
list.append(1)
list.append(2)
list.prepend(0)
list.display

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

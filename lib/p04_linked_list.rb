
class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  include Enumerable
  attr_reader :head

  def initialize
    @head = Link.new
    @tail = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
  end

  def last
  end

  def empty?
  end

  def get(key)
    current = @head
    loop do
    return current.val if current.key == key
    current = current.next
    break if current == nil
    end
    nil
  end

  def include?(key)
    each do |link|
      return true if link.key == key
    end
    false
  end

  def insert(key, val)
    @tail.next = Link.new(key, val, nil)
    @tail = @tail.next
  end

  def remove(key)
    if key == @head.key
      @head = @head.next
      return key
    end
    return nil unless include?(key)
    previous = nil
    each do |link|
      if link.next.key == key
        previous = link
        break
      end
    end
    del_link = previous.next
    previous.next = del_link.next

  end

  def each
    current = @head
    while current
      yield current
      current = current.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

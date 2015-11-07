require 'byebug'
require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    index = key.to_s.hash % @store.count
    @store[index].include?(key)
  end

  def set(key, val)
    #byebug
    if count > 


    index = key.to_s.hash % @store.count
    #@store[index].insert(key)
    #self.delete(key) if self.include?(key)

    @store[index].insert(key, val)
    @count += 1
  end

  def get(key)
    index = key.to_s.hash % @store.count
    @store[index].get(key)
  end

  def delete(key)
    index = key.to_s.hash % @store.count
    @store[index].remove(key)
    @count -= 1
  end

  def each
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    old_count = @count
    @store = Array.new(old_store.size*2) {LinkedList.new}
    old_store.each do |bucket|
      bucket.each do |link|
        if bucket.head.next != nil
          self.set(link.key, link.val)
        end
      end
    end
    @count = old_count
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end

linkedlist = LinkedList.new
linkedlist.insert(:first,1)
linkedlist.insert(:second, 2)
linkedlist.insert(:third, 3)
p linkedlist
linkedlist.remove(:first)
p linkedlist
p linkedlist.head


hash = HashMap.new
hash.set(:first, 1)
hash.set(:second, 2)
hash.set(:third, 3)
# hash
hash.set(:first,"one")
#p hash
#
 hash.set(:four, 1)
 hash[:four] = "four"
 p hash[:four]

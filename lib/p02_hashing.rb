

class Fixnum
  # Fixnum#hash already implemented for you
end

class Array

  def hash
    key = 12312731928371293719237912739127391283781923791273.to_s(2).to_i
    self.join.to_i.to_s(2).to_i ^ key

  end
end

class String
  def hash
    split('').map {|char| char.ord}.hash
  end
end

class Hash
  def hash
    keys.sort.map(&:to_s).join.hash
  end
end

#
# a = ("a".."z").to_a * 3
# puts "String Hash #{a.join.hash}"

Dir["./lib/*.rb"].each {|file| load file }

class Cat < SQLObject
  self.finalize!
end

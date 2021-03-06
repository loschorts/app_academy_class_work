require 'sqlite3'
require 'singleton'
class QuestionsDB < SQLite3::Database
  include Singleton
  def initialize
    super('questions.db')
    self.results_as_hash = true
    self.type_translation = true
  end
end

require_relative 'query_objects'

def reload
  load __FILE__
end

class Step < ActiveRecord::Base
  validates :text, :done, :todo_id, presence: true

  belongs_to :todo

end

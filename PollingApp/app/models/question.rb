class Question < ActiveRecord::Base
  validates :poll_id, :text, presence: true
  validates :text, uniqueness: true

  has_many :answer_choices,
    foreign_key: :question_id,
    primary_key: :id,
    class_name: "AnswerChoice"

  belongs_to :poll,
    foreign_key: :poll_id,
    primary_key: :id,
    class_name: "Poll"
end

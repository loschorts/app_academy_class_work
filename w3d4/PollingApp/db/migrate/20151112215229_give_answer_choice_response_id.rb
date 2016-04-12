class GiveAnswerChoiceResponseId < ActiveRecord::Migration
  def change
    add_column :answer_choices, :response_id, :integer
  end
end

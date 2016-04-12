class ModifyResponsesTable < ActiveRecord::Migration
  def change
    remove_column :responses, :question_id, :integer
    add_column :responses, :answer_choice_id, :integer
    rename_column :responses, :user_id, :respondent_id

    add_index :responses, :answer_choice_id, unique: true
  end
end

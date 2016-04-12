class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :question_id, null: false
      t.timestamps
    end
    add_index :responses, :user_id, unique: true
    add_index :responses, :question_id, unique: true

  end
end

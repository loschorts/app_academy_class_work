class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :text, null: false
      t.integer :poll_id, null: false
      t.timestamps
    end

    add_index :questions, :poll_id, unique: true
    add_index :polls, :author_id, unique: true

    change_column :users, :user_name, :string, null: false
    change_column :polls, :title, :string, null: false
    change_column :polls, :author_id, :integer, null: false
  end
end

class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :text, null: false
      t.boolean :done, default: false
      t.integer :todo_id, null: false
      t.timestamps null: false
    end

    add_index :steps, :todo_id
  end
end

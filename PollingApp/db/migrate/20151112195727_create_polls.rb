class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :title, null: true
      t.integer :author_id, null: true
      t.timestamps
    end
  end
end

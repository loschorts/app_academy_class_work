class CreateVisit < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :shortened_url_id, null: true, length: 16
      t.string :visitor_id, null: true
      t.integer :times_visited, default: 0
      t.timestamps
    end

    add_index :visits, :shortened_url_id
  end
end

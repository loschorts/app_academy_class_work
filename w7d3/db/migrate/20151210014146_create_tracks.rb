class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, presence: true
      t.string :roll, presence: true
      t.timestamps null: false
    end
  end
end

class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :user_id, null: true
      t.integer :tag_id, null: true
      t.integer :shortened_url_id, null: true

      t.timestamp
    end

    create_table :tags do |t|
      t.string :topic, null: true

      t.timestamp
    end

    add_index :tags, :topic, unique: true
  end
end

class CreateShortenedUrl < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
        t.string :short_url, unique: true
        t.string :long_url, null: true, unqiue: true
        t.integer :user_id, null: true

        t.timestamp
    end
    add_index :shortened_urls, :short_url, unique: true
    add_index :shortened_urls, :user_id
  end
end

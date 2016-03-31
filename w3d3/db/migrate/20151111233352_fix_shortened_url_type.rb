class FixShortenedUrlType < ActiveRecord::Migration
  def change
    change_column :visits, :shortened_url_id, :integer
  end
end

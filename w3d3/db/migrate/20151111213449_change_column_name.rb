class ChangeColumnName < ActiveRecord::Migration
  def change
      rename_column :shortened_urls, :user_id, :submitted_id
  end
end

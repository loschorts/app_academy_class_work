class Note < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :track
  validates :user_id, :track_id, :note, presence: true
end

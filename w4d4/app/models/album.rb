class Album < ActiveRecord::Base
  belongs_to :band,
    foreign_key: :band_id,
    primary_key: :id,
    class_name: "Band"
  has_many :tracks, dependent: :destroy

  validates :name, :band_id, presence: true
end

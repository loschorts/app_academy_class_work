class Track < ActiveRecord::Base
  belongs_to :album
  has_one :band, through: :album
  has_many :notes

  validates :name, :album_id, presence: true
end

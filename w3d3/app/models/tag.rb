class Tag < ActiveRecord::Base
  validates :topic, uniqueness: true, presence: true

  has_many :taggings,
    foreign_key: :tag_id,
    primary_key: :id,
    class_name: "Tagging"

end

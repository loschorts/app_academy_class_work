class User < ActiveRecord::Base
  has_many :contacts,
    dependent: :destroy,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: "Contact"
  has_many :contact_shares,
    dependent: :destroy,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: "ContactShare"
  has_many :shared_contacts,
    dependent: :destroy,
    through: :contact_shares,
    source: :contact
  validates :username, presence: true, uniqueness: true
end

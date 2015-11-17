class ContactShare < ActiveRecord::Base
  belongs_to :contact,
    foreign_key: :contact_id,
    primary_key: :id,
    class_name: "Contact"
  belongs_to :user,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: "User"

  validates :user_id, :contact_id, presence: true
  validates :contact_id, :uniqueness => {:scope => :user_id}

end

class Visit < ActiveRecord::Base

  validates :shortened_url_id, :visitor_id, presence: true

  belongs_to :visitor,
    foreign_key: :visitor_id,
    primary_key: :id,
    class_name: "User"

  belongs_to :visited_url,
    foreign_key: :shortened_url_id,
    primary_key: :id,
    class_name: "ShortenedUrl"

  def self.record_visit! user, shortened_url
    Visit.create!(shortened_url_id: shortened_url.id, visitor_id: user.id)
  end
end

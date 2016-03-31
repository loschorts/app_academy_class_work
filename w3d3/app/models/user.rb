class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many :submitted_urls,
    foreign_key: :submitted_id,
    primary_key: :id,
    class_name: "ShortenedUrl"

  has_many :visits,
    foreign_key: :visitor_id,
    primary_key: :id,
    class_name: "Visit"

  has_many :visited_urls,
    through: :visits,
    source: :visited_url

  has_many :taggings,
    foreign_key: :tagger_id,
    primary_key: :id,
    class_name: "Tagging"

  def tag surl, tag
    raise "You have not visited that URL!" unless self.visited_urls.include?(surl)
    surl_id = surl.id
    tag_id = tag.id
    Tagging.create!(user_id: self.id, shortened_url_id: surl_id, tag_id: tag_id)
  end
end

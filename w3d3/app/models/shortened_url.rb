class ShortenedUrl < ActiveRecord::Base
  require 'securerandom'

  validates :long_url, length: {maximum: 1024}
  validates :validates_user_status

  belongs_to :submitter,
    foreign_key: :submitted_id,
    primary_key: :id,
    class_name: "User"

  has_many :visits,
    foreign_key: :shortened_url_id,
    primary_key: :id,
    class_name: "Visit"

  has_many :visitors,
    through: :visits,
    source: :visitor

  has_many :unique_visitors,
    Proc.new { distinct },
    through: :visits,
    source: :visitor

  has_many :taggings,
    foreign_key: :shortened_url_id,
    primary_key: :id,
    class_name: "Tagging"

  def num_clicks
    Visit.all.select {|v| v.shortened_url_id == self.id}.count
  end

  def num_uniques
    unique_visitors.count
  end

  def num_recent_uniques
    Visit.select(:created_at).select{|v| v.created_at < 10.minutes.ago }
  end

  def self.random_code
    code = nil
    loop do
    code = SecureRandom::urlsafe_base64[0..15]
    break unless self.exists?(short_url: code)
    end
    code
  end

  def self.create_for_user_and_long_url! user, long_url
    self.new(short_url: self.random_code, long_url: long_url, submitted_id: user.id).save!
  end
  private
  def validates_user_status
    user = User.find(submitted_id)
    if user.premium || user.submitted_urls.count < 5
      error[:base] << "Too many URLS for a Non-Premium User"
    end
  end

end

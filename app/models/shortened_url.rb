class ShortenedUrl < ActiveRecord::Base
  require 'securerandom'

  belongs_to :submitter,
    foreign_key: :submitted_id,
    primary_key: :id,
    class_name: "User"

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

end

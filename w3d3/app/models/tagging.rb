class Tagging < ActiveRecord::Base
  validates :user_id, :tag_id, :shortened_url_id, presence: true
  validate(:validate_user_id)
  validate(:validate_tag_id)
  validate(:validate_url_id)

  belongs_to :tagger,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: "User"

  belongs_to :tag,
    foreign_key: :tag_id,
    primary_key: :id,
    class_name: "Tag"

  belongs_to :tagged_url,
    foreign_key: :shortened_url_id,
    primary_key: :id,
    class_name: "ShortenedUrl"

  private
  def validate_user_id

    if User.find(self.user_id).nil?
      errors[:user_id] << "Invalid User ID!"
    end

  end

  def validate_tag_id

    if Tag.find(self.tag_id).nil?
      errors[:tag_id] << "Invalid tag ID!"
    end

  end

  def validate_url_id

    if ShortenedUrl.find(self.shortened_url_id).nil?
      errors[:shortened_url_id] << "Invalid tag ID!"
    end

  end
end

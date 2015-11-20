class User < ActiveRecord::Base
  has_many :notes
  include UsersHelper
  attr_accessor :password
  validates :email, :password_digest, :session_token, presence: true
  validates :password, presence: true, allow_nil: true
  after_initialize :ensure_session_token

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def login!

  end

  def is_password? password
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials options
    user = User.find_by(email: options[:email])
    return nil unless user

    user.is_password?(options[:password]) ? user : nil
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end

  def generate_session_token
    SecureRandom.urlsafe_base64
  end

end

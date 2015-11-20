class User < ActiveRecord::Base
  validates :username, :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  attr_reader :password

  #before_initialize :ensure_session_token

  def password= password
    @password = password
    self.password_digest = BCrypt::Password.create(@password)
  end

  def is_password? password
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def generate_session_token
  end
end

class User < ApplicationRecord
  validates :username, :email, :first_name, :last_name, :gender, :birthday, :password_digest, presence: true
  validates :username, uniqueness: true
  after_initialize :ensure_session_token
  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    user && user.is_password?(password) ? user : nil 
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.update!(session_token: self.class.generate_session_token)
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end

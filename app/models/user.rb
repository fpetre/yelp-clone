require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :username, :session_token, uniqueness: true

  has_many :reviews, inverse_of: :user


  after_initialize :ensure_session_token

  attr_reader :password

  has_attached_file :profile_photo, :styles => {
    thumb: "150x>",
    small: "300x>",
    medium: "450x>",
    large: "900x>"
  }

  validates_attachment_content_type(
    :profile_photo,
    :content_type => /\Aimage\/.*\Z/
  )

  def password=(password)
    @password = password
    self.password_digest = Password.create(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    user.try(:is_password?, password) ? user : nil
  end

  def is_password?(password)
    Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end






end

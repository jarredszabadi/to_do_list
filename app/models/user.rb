class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  has_many :notes
  

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  

  
    def create_note!(text, assigned)
      self.notes.create!(text: text, assigned: assigned)
    end
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end

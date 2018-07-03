class User < ApplicationRecord
  has_secure_password
  has_secure_password
  has_many :adds, dependent: :destroy 
  before_save :downcase

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  validates :password, length: {minimum: 8}, on: :create

  private 
    def downcase
      self.email.downcase!
    end

end

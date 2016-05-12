class User < ActiveRecord::Base
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  has_secure_password

  before_save { email.downcase! }

  validates :name,  presence: true,
                    length: { maximum: 50 }

  validates :email, presence: true,
                    length: { maximum: 100 },
                    format: { with: EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, presence: true,
                       length: { minimum: 6 }
end

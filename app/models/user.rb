class User < ApplicationRecord
    before_save { self.email = email.downcase }
    has_many :articles, dependent: :destroy

    validates :username, presence: true,length: {in: 3..15},uniqueness: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true ,length: {maximum: 105},uniqueness: { case_sensitive: false },format: {with: VALID_EMAIL_REGEX }
    
    has_secure_password
end
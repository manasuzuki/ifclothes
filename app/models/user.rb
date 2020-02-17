class User < ApplicationRecord
    before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :phone, presence: true, length: { maximum: 11 }
  validates :postalcode, presence: true, length: {maximum: 7 }
  validates :prefecture, presence: true, length: { maximum: 10 }
  validates :address, presence: true, length: { maximum: 50 }
    has_secure_password
end

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

    has_many :posts
    has_many :buyings
    has_many :buys, through: :buyings, source: :post
    has_many :reverses_of_buying, class_name:'Buying', foreign_key:'post_id'
    has_many :bought, through: :reverses_of_buying, source: :user
    
  def buy(post) #I'm gonna buy post
     self.buyings.find_or_create_by(post_id: post.id)
    
  end
  
  def unbuy(post)
    buying = self.buyings.find_by(post_id: post.id)
    buying.destroy if buying
  end
  
  def buying?(post)
    self.buys.include?(post)
  end
end  
class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_one_attached :photo
  has_many :articles
  has_secure_password
  validates :password, presence: true, length: { maximum: 32, minimum: 8 }
  validates :email, presence: true, length: { maximum: 100 }
  def full_name
    self.first_name + " " + self.last_name
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end

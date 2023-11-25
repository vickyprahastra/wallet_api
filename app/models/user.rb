class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  enum account_type: { user: 0, team: 1, stock: 2 }
end

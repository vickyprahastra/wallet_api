class User < ApplicationRecord
  has_secure_password

  enum account_type: { user: 0, team: 1, stock: 2 }
end

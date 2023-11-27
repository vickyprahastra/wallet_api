class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  enum account_type: { user: 0, team: 1, stock: 2 }
  has_many :transactions

  def transfer(amount, receiver)
    return unless receiver.present?

    return {message: "Amount is exceeded from your balance"} if balance < amount.to_f

    ActiveRecord::Base.transaction do
      transactions.create( transaction_type: :debit, amount: amount, transfer_from: self, transfer_to: receiver)
      receiver.transactions.create( transaction_type: :credit, amount: amount, transfer_from: self, transfer_to: receiver)
    end

    return {message: "Successfully sent", balance: balance}
  end

  def withdraw(amount)
    return {message: "Amount is exceeded from your balance"} if balance < amount.to_f

    transactions.create( transaction_type: :debit, amount: amount, transfer_from: self, transfer_from: self)

    return {message: "Successfully withdraw", balance: balance}
  end

  def balance
    transactions.credit.sum(:amount) - transactions.debit.sum(:amount)
  end
end

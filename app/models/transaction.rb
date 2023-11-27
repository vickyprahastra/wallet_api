class Transaction < ApplicationRecord
  belongs_to :user

  belongs_to :transfer_from, class_name: 'User', optional: true
  belongs_to :transfer_to, class_name: 'User', optional: true

  enum transaction_type: { credit: 0, debit: 1 }
  validates :amount, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 1000000 }
end

class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.decimal    :amount
      t.integer    :transaction_type
      t.references :transfer_from, type: :uuid
      t.references :transfer_to, type: :uuid

      t.timestamps
    end
  end
end

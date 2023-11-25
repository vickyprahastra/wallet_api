class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :username
      t.string :password_digest
      t.integer :account_type, default: 0

      t.timestamps
    end
  end
end

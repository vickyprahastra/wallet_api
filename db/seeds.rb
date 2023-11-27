10.times do |i|
  user = User.create!({
    name: "Name example-#{i}",
    username: "user#{i}",
    password: "password",
    password_confirmation: "password",
    account_type: User.account_types.values.sample
  })

  Transaction.create!(
    user_id: user.id,
    amount: 100000,
    transaction_type: :credit,
    transfer_to: user,
  )
end

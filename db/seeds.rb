10.times do |i|
  User.create!({
    :username => "user#{i}",
    :password => "password",
    :password_confirmation => "password",
    :account_type => User.account_types.values.sample
  })
end

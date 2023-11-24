user1 = 'user1@example.com'
user2 = 'user1@example.com'

User.create!({
  :email => user1,
  :role => "super_admin",
  :password => "password1",
  :password_confirmation => "password1"
}) unless User.find_by_email(user1)

User.create!({
  :email => user2,
  :role => "admin",
  :password => "kIm8o4Vk",
  :password_confirmation => "kIm8o4Vk"
}) unless User.find_by_email(user2)


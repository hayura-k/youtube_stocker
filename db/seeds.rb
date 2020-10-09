User.create(
  username: 'guest',
  email: 'guest@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: 'guest_user'
)
puts 'ゲストユーザーを作成しました'

2.times do |n|
  User.create(
    username: "user#{n}",
    email: "user#{n}@example.com",
    password: 'password',
    password_confirmation: 'password',
  )
  puts "ユーザーを作成しました"
end

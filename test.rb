hash_users = Array.new(10) do
  {
    name: FFaker::Internet.user_name[0...16],
    email: FFaker::Internet.safe_email,
    password: "password"
  }
end

puts hash_users

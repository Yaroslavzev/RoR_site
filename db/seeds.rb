# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Comment.destroy_all

hash_users = Array.new(10) do
  {
    name: FFaker::Internet.user_name[0...16],
    email: FFaker::Internet.safe_email,
    password: "password"
  }
end
users = User.create! hash_users

hash_posts = Array.new(10) do
  {
    title: FFaker::Conference.name,
    body: Array.new(rand(4...6)) { FFaker::HipsterIpsum.sentence(word_count = 2) },
    user: users.sample,
    place: FFaker::Venue.name,
    date_from: FFaker::Time.between(Time.current, Time.current + 5.days),
    date_to: FFaker::Time.between(Time.current + 6, Time.current + 10.days)
  }
end
events = Event.create! hash_posts

hash_comments = Array.new(200) do
  {
    body: FFaker::HipsterIpsum.sentence,
    user: users.sample,
    event: events.sample
  }
end
Comment.create! hash_comments

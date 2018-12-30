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

hash_users = 10.times.map do
  {
    name: FFaker::Internet.user_name[0...16],
    email: FFaker::Internet.safe_email,
    password: "password"
  }
end
users = User.create! hash_users
users.first(7).each { |u| u.update creator: true }
users.first(2).each { |u| u.update moderator: true }

creators = User.where(creator: true)
hash_posts = 10.times.map do
  {
    title: FFaker::Conference.name,
    body: Array.new(rand(4...6)) {FFaker::HipsterIpsum.sentence(word_count = 2)},
    user: creators.sample,
    place: FFaker::Venue.name,
    date_from: FFaker::Time.between(Time.current, Time.current + 5.day),
    date_to: FFaker::Time.between(Time.current+5, Time.current + 10.day)
  }
end
posts = Event.create! hash_posts

hash_comments = 200.times.map do
  commentable = ((rand(2) == 1) ? posts : users).sample
  {
    body: FFaker::HipsterIpsum.sentence,
    user: users.sample,
    commentable_id: commentable.id,
    commentable_type: commentable.class.to_s
  }
end
Comment.create! hash_comments

require 'faker'

#Create Users
5.times do
  user = User.new(
    name:      Faker::Name.name,
    email:     Faker::Internet.email,
    password:  Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end

user = User.new(
  name:     "Gary Thomas",
  email:    "person@example.com",
  password: "password"
  )
  user.skip_confirmation!
  user.save!

users = User.all

# Create Topics
10.times do
  Topic.create!(
    title: Faker::Lorem.word
    )
end

topics = Topic.all

# Create Bookmarks
50.times do
  Bookmark.create!(
    topic: topics.sample,
    url:   Faker::Internet.url,
    title: Faker::Company.name
    )
end

bookmarks = Bookmark.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
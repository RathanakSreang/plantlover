# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def seed_image(file_name)
  File.open(
    File.join(Rails.root, "/app/assets/images/seed/#{file_name}.jpg")
  )
end

User.create! name: "RathanakJame",
             username: "rathanak",
             password: '1234567890',
             password_confirmation: '1234567890',
             sex: 'M'

10.times do |n|
  User.create! name: "Rathanak-#{n}",
               username: "rathanak_#{n}",
               password: '1234567890',
               password_confirmation: '1234567890',
               sex: 'M'
end

2.times do |n|
  User.all.each do |user|
    Plant.create! name: "sample tree name #{n}",
                 scientific_name: "sample tree scientific name #{n}",
                 description: "sample tree description #{n}",
                 picture: seed_image("plant_sample"),
                 user_id: user.id
  end
end

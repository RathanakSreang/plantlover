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

20.times do |n|
  Plant.create! name: "sample tree name #{n}",
               scientific_name: "sample tree scientific name #{n}",
               description: "sample tree description #{n}",
               picture: seed_image("plant_sample")
end

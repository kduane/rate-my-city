# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  City.create(
    city_name: Faker::OnePiece.location,
    description: Faker::Hipster.paragraph
  )
end

City.all.each do |city|
  3.times do
    Review.create(
      city_id: city.id,
      title: Faker::OnePiece.akuma_no_mi,
      body: Faker::OnePiece.quote
    )
  end
end

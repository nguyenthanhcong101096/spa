# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if AdminUser.count < 1
  AdminUser.find_or_create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end

5.times do |i|
  location = "public/ashion/img/categories/category-#{i + 1}.jpg"
  image = Rails.root.join(location)
  category = FactoryBot.create(:category, image: image.open)

  9.times do |j|
    location = "public/ashion/img/shop/shop-#{j + 1}.jpg"
    image = Rails.root.join(location)

    FactoryBot.create(:product, category_id: category.id, image: image.open)
  end
end

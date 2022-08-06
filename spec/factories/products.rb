FactoryBot.define do
  factory :product do
    description { Faker::Lorem.paragraphs.join }
    name { Faker::Name.name }
    price { 50000 }
  end
end

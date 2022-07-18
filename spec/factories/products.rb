FactoryBot.define do
  factory :product do
    description { Faker::Lorem.paragraphs }
    name { Faker::Name.name }
    price { 50000 }
  end
end

FactoryBot.define do
  factory :category do
    describe { Faker::Lorem.paragraphs.join }
    name { Faker::Name.name }
    code { SecureRandom.uuid }
  end
end

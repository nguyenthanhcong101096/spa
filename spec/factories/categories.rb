FactoryBot.define do
  factory :category do
    describe { Faker::Lorem.paragraphs }
    name { Faker::Name.name }
    code { SecureRandom.uuid }
  end
end

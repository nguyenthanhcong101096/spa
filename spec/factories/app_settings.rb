FactoryBot.define do
  factory :app_setting do
    location = "public/ashion/img/logo.png"
    image = Rails.root.join(location)

    description { Faker::Lorem.paragraphs.join }
    title   { Faker::Name.name }
    address { 'Your address' }
    phone   { '09182309809123' }
    email   { 'example@gmail.com' }
    logo    { image.open }
    width_logo { 100 }
    height_logo { 50 }
    google_map { "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d16591.0978059068!2d106.68876660553987!3d10.772726388446404!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f3959037bc1%3A0xd6bbd8e1507b0468!2sB%E1%BA%BFn%20Th%C3%A0nh%2C%20District%201%2C%20Ho%20Chi%20Minh%20City!5e0!3m2!1sen!2s!4v1659764342796!5m2!1sen!2s" }
  end
end

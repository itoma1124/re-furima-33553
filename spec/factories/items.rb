FactoryBot.define do
  factory :item do
    name             {Faker::Games::Pokemon.name}
    detail           {Faker::Lorem.sentence}
    category_id      {rand(1..9)}
    status_id        {rand(1..6)}
    fare_id          {rand(1..2)}
    province_id      {rand(1..47)}
    shipment_day_id  {rand(1..3)}
    price            {rand(300..999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

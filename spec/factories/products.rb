# Read about factories at https://github.com/thoughtbot/factory_girl
random_price = Random.new(1234)

FactoryGirl.define do
  factory :product do
    name         Faker::Commerce.product_name
    price        "#{random_price.rand(200)}.#{random_price.rand(10..99)}".to_f
    description  Faker::Lorem.paragraph
  end
end

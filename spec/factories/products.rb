# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  sequence(:price) do |n|
    random_price = Random.new(n)
    "#{random_price.rand(200)}.#{random_price.rand(10..99)}".to_f
  end

  sequence(:name) do |n|
    Faker::Commerce.product_name
  end

  sequence(:description) do |n|
    Faker::Lorem.paragraph
  end

  factory :product do
    name
    price
    description
  end
end

FactoryBot.define do
  factory(:user) do
    id { rand(1..1000) }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory(:test_product) do
    id { rand(1..1000) }
    product_name { Faker::Commerce.product_name }
    price { rand(1.100000)}
    description { Faker::Lorem.paragraph }
    association :user, factory: :user
  end
end
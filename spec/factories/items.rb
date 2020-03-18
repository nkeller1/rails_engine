FactoryBot.define do
  factory :item do
    name { "Rufus Toy" }
    description { "Just the best!"}
    unit_price { 12345 }
    association :merchant, factory: :merchant
  end
end

FactoryBot.define do
  factory :invoice_item do
    quantity { 1 }
    unit_price { 5 }
    item
    invoice
  end
end

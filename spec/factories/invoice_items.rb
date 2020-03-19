FactoryBot.define do
  factory :invoiceitem do
    quantity { 1 }
    unit_price { 5 }
    item
    invoice
  end
end

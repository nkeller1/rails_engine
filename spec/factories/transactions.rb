FactoryBot.define do
  factory :transaction do
    credit_card_number { 4654405418249632 }
    credit_card_expiration_date { "2012-03-27 14:54:09 UTC" }
    result { "success" }
    invoice
  end
end

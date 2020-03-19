require 'rails_helper'

describe "Items API" do
  Merchant.destroy_all
  it "sends a list of merchants" do
    merchant = create(:merchant)
    merchant1 = create(:merchant)

    item = create(:item, merchant: merchant)
    item1 = create(:item, merchant: merchant)
    item2 = create(:item, merchant: merchant1)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)
    require "pry"; binding.pry
    expect(merchants.count).to eq(1)
  end
end

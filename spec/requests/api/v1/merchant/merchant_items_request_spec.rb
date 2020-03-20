require 'rails_helper'

describe "Merchant Items API" do
  Item.destroy_all
  Merchant.destroy_all
  it "sends a list of a particular merchants items" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    item1 = create(:item, merchant: merchant)
    item2 = create(:item, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful

    merchant_items = JSON.parse(response.body)['data']

    expect(merchant.items.count).to eq(3)
  end
end

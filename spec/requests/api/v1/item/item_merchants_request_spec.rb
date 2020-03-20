require 'rails_helper'

describe "Item Merchants API" do
  Item.destroy_all
  Merchant.destroy_all
  it "sends a list of the merchant assigned to an item" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_successful

    items_merchant = JSON.parse(response.body)['data']
    
    expect(items_merchant['id']).to eq(merchant.id.to_s)
  end
end

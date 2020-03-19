require 'rails_helper'

describe "Items API" do
  Item.destroy_all
  it "sends a list of items" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    item1 = create(:item, merchant: merchant)
    item2 = create(:item, merchant: merchant)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body)
    
    expect(items.count).to eq(1)
  end
end

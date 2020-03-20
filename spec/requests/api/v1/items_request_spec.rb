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

    items = JSON.parse(response.body)['data']

    expect(items.count).to eq(3)
  end

  it "can get one item by its id" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)

    get "/api/v1/items/#{item.id}"

    item1 = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item1['data']['id']).to eq(item.id.to_s)
  end

  xit "can create a new item" do
    merchant = create(:merchant)
    item_params = {
      name: "Rufus",
      description: "Best Stuffed Animal",
      unit_price: 5
      }

    require "pry"; binding.pry
    post "/api/v1/items", params: {item: item_params}

    item = Item.last

    expect(response).to be_successful
    expect(item.name).to eq(item_params[:name])
  end

  it "can update an existing item" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)

    previous_name = Item.last.name

    item_params = { name: "Rufus", description: "Best Friend", unit_price: 10 }

    put "/api/v1/items/#{item.id}", params: {item: item_params}
    item1 = Item.find_by(id: item.id)

    expect(response).to be_successful
    expect(item1.name).to_not eq(previous_name)
    expect(item1.name).to eq("Rufus")
    expect(item1.description).to eq("Best Friend")
  end

  it "can destroy an item" do
    item = create(:item)

    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{item.id}"

    expect(response).to be_successful
    expect(Item.count).to eq(0)
    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end

require 'rails_helper'

describe "Merchant API" do
  Merchant.destroy_all
  it "sends a list of merchants" do
    merchant = create(:merchant)
    merchant1 = create(:merchant)

    item = create(:item, merchant: merchant)
    item1 = create(:item, merchant: merchant)
    item2 = create(:item, merchant: merchant1)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)["data"]

    expect(merchants.count).to eq(2)
  end

  it "can get one merchant by its id" do
    merchant1 = create(:merchant)

    get "/api/v1/merchants/#{merchant1.id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful

    expect(merchant['data']['id']).to eq(merchant1.id.to_s)
  end

  # it "can create a new item" do
  #   merchant_params = { name: "Saw", description: "I want to play a game" }
  #
  #   post "/api/v1/items", params: {item: merchant_params}
  #   item = Item.last
  #
  #   expect(response).to be_successful
  #   expect(item.name).to eq(merchant_params[:name])
  # end
  #
  # it "can update an existing item" do
  #   id = create(:item).id
  #   previous_name = Item.last.name
  #   merchant_params = { name: "Sledge" }
  #
  #   put "/api/v1/items/#{id}", params: {item: merchant_params}
  #   item = Item.find_by(id: id)
  #
  #   expect(response).to be_successful
  #   expect(item.name).to_not eq(previous_name)
  #   expect(item.name).to eq("Sledge")
  # end
  #
  # it "can destroy an item" do
  #   item = create(:item)
  #
  #   expect(Item.count).to eq(1)
  #
  #   delete "/api/v1/items/#{item.id}"
  #
  #   expect(response).to be_successful
  #   expect(Item.count).to eq(0)
  #   expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  # end
end

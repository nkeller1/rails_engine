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

  it "can create a new item" do
    merchant = create(:merchant)
    item_params = {
      name: "Rufus",
      description: "Best Stuffed Animal",
      unit_price: 5,
      merchant_id: merchant.id
      }

    post "/api/v1/items", params: item_params

    item = Item.last

    expect(response).to be_successful
    expect(item.name).to eq(item_params[:name])
  end

  it "can update an existing item" do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)

    previous_name = Item.last.name

    item_params = { name: "Rufus", description: "Best Friend", unit_price: 10 }

    put "/api/v1/items/#{item.id}", params: item_params
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

  describe 'Item find Endpoints' do
    it 'can find an item by its id' do
      merchant = create(:merchant)
      item = create(:item, id: 65)

      get "/api/v1/items/find?id=#{item.id.to_s}"

      item1 = JSON.parse(response.body)['data']

      expect(response).to be_successful
      expect(item1.first['id']).to eql("65")
    end

    it 'can find an item by its name' do
      item = create(:item, name: "Hippty Hop")

      get "/api/v1/items/find?name=#{item.name}"

      item1 = JSON.parse(response.body)['data']

      expect(response).to be_successful
      expect(item1.first['attributes']['name']).to eq(item.name)
    end

    it 'can find an item by its created_at_date' do
      item = create(:item, created_at: "Sat, 21 Mar 2020 18:30:25 UTC +00:00,")

      get "/api/v1/items/find?created_at=#{item.created_at}"

      item1 = JSON.parse(response.body)['data']

      expect(response).to be_successful
      expect(item1.first['id']).to eql(item.id.to_s)
    end

    it 'can find a item by its updated_at date' do
      item = create(:item, updated_at: "Sat, 21 Mar 2020 18:30:25 UTC +00:00,")

      get "/api/v1/items/find?updated_at=#{item.updated_at}"

      item1 = JSON.parse(response.body)['data']

      expect(response).to be_successful
      expect(item1.first['id']).to eql(item.id.to_s)
    end

    it 'can find a item by multiple attributes' do
      item = create(:item, name: "Seltzer", description: "Yummy")

      get "/api/v1/items/find?name=#{item.name}&description=#{item.description}"

      item1 = JSON.parse(response.body)['data']

      expect(response).to be_successful
      expect(item1.first['attributes']['name']).to eql("Seltzer")
    end

    xit 'can find a merchant based on partial parameters' do
      merchant = create(:merchant, name: "Joe's Shack")
      merchant1 = create(:merchant, name: "Johns Shack")
      merchant1 = create(:merchant, name: "Nathan's Place")

      get "/api/v1/merchants/find?name=Jo"

      expect(response).to be_successful

      search = JSON.parse(response.body)['data']

      expect(search.first['attributes']['name']).to eql("Joe's Shack")
      expect(search.first['id']).to eq(merchant.id.to_s)
      expect(search.first['attributes']).to have_key('name')
      expect(search.first['attributes']['name']).to eq (merchant_1.name)
    end
  end
end

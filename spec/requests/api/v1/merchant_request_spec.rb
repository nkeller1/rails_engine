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

  it "can create a new merchant" do
    merchant_params = { name: "Saw" }

    post "/api/v1/merchants", params: {merchant: merchant_params}
    merchant = Merchant.last

    expect(response).to be_successful

    expect(merchant.name).to eq(merchant_params[:name])
  end
  #
  it "can update an existing merchant" do
    id = create(:merchant).id

    previous_name = Merchant.last.name

    merchant_params = { name: "Sledge" }

    put "/api/v1/merchants/#{id}", params: {merchant: merchant_params}
    merchant = Merchant.find_by(id: id)

    expect(response).to be_successful

    expect(merchant.name).to_not eq(previous_name)
    expect(merchant.name).to eq("Sledge")
  end

  it "can destroy an merchant" do
    merchant = create(:merchant)

    expect(Merchant.count).to eq(1)

    delete "/api/v1/merchants/#{merchant.id}"

    expect(response).to be_successful
    expect(Merchant.count).to eq(0)
    expect{Merchant.find(merchant.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  describe 'Merchant find Endpoints' do
    it 'can find a merchant by their id' do
      merchant = create(:merchant, id: 666)

      get "/api/v1/merchants/find?id=#{merchant.id.to_s}"

      merchant1 = JSON.parse(response.body)['data']

      expect(response).to be_successful
      expect(merchant1.first['id']).to eql("666")
    end

    it 'can find a merchant by their name' do
      merchant = create(:merchant, name: "Seltzer Shack")

      get "/api/v1/merchants/find?name=#{merchant.name}"

      merchant1 = JSON.parse(response.body)['data']

      expect(response).to be_successful
      expect(merchant1.first['attributes']['name']).to eql("Seltzer Shack")
    end

    it 'can find a merchant by their created_at_date' do
      merchant = create(:merchant, created_at: "Sat, 21 Mar 2020 18:30:25 UTC +00:00,")

      get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

      merchant1 = JSON.parse(response.body)['data']

      expect(response).to be_successful
      expect(merchant1.first['id']).to eql(merchant.id.to_s)
    end

    it 'can find a merchant by their updated_at date' do
      merchant = create(:merchant, updated_at: "Sat, 21 Mar 2020 18:30:25 UTC +00:00,")

      get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"

      merchant1 = JSON.parse(response.body)['data']

      expect(response).to be_successful
      expect(merchant1.first['id']).to eql(merchant.id.to_s)
    end

    it 'can find a merchant by multiple attributes' do
      merchant = create(:merchant, name: "Seltzer Shack", updated_at: "Sat, 21 Mar 2020 18:30:25 UTC +00:00," )

      get "/api/v1/merchants/find?name=#{merchant.name}&updated_at=#{merchant.updated_at}"

      merchant1 = JSON.parse(response.body)['data']

      expect(response).to be_successful
      expect(merchant1.first['attributes']['name']).to eql("Seltzer Shack")
    end

    xit 'can find a merchant based on partial parameters' do
      merchant = create(:merchant, name: "Joe's Shack")
      merchant1 = create(:merchant, name: "Johns Shack")
      merchant1 = create(:merchant, name: "Nathan's Place")

      get "/api/v1/merchants/find?name=Jo"

      expect(response).to be_successful

      search = JSON.parse(response.body)['data']
      require "pry"; binding.pry
      expect(search.first['attributes']['name']).to eql("Joe's Shack")
      expect(search.first['id']).to eq(merchant.id.to_s)
      expect(search.first['attributes']).to have_key('name')
      expect(search.first['attributes']['name']).to eq (merchant_1.name)
    end
  end
end

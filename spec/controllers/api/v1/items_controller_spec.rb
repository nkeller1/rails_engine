require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      merchant = create(:merchant)
      item = create(:item, merchant: merchant)
      item1 = create(:item, merchant: merchant)
      item2 = create(:item, merchant: merchant)

      get :index

      expect(response).to have_http_status(:success)

      items = JSON.parse(response.body)['data']

      expect(items.count).to eq(3)
    end
  end
end

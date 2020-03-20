require 'rails_helper'

xRSpec.describe Api::V1::Merchants::MerchantItemsController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      merchant = create(:merchant)
      item = create(:item, merchant: merchant)
      item1 = create(:item, merchant: merchant)
      item2 = create(:item, merchant: merchant)

      get "/api/v1/merchants/#{merchant.id}/items"

      expect(response).to have_http_status(:success)
    end
  end
# end

require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      merchant = create(:merchant)
      item = create(:item, merchant: merchant)
      item1 = create(:item, merchant: merchant)
      item2 = create(:item, merchant: merchant)
      
      require "pry"; binding.pry
      get :index

      expect(response).to have_http_status(:success)
    end
  end
end

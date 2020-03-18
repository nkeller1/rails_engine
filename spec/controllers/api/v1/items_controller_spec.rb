require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      create_list(:item, 5)

      get :index

      expect(response).to have_http_status(:success)
    end
  end
end

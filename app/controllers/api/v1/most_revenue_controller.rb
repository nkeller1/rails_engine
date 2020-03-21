class Api::V1::MostRevenueController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all)
  end
end

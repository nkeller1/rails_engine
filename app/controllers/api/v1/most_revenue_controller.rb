class Api::V1::MostRevenueController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.most_revenue(params[:quantity].to_i))
  end
end

class Api::V1::MostItemsSoldController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all.most_items_sold(params[:quantity].to_i))
  end
end

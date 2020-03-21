class Api::V1::FindController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.where(request.GET))
  end
end

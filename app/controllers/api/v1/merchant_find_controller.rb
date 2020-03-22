class Api::V1::MerchantFindController < ApplicationController
  def show
    render json: MerchantSerializer.new(Merchant.where(request.GET).limit(1))
  end
end

class Api::V1::FindController < ApplicationController
    def index
      # require "pry"; binding.pry
      render json: MerchantSerializer.new(Merchant.where(request.GET))
    end

    # def show
    #   render json: MerchantSerializer.new(Merchant.where(request.GET))
    # end
end

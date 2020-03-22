class Api::V1::ItemsMerchantController < ApplicationController
  before_action :set_item

  def index
    render json: MerchantSerializer.new(@items.merchant)
  end

  private

   def set_item
      @items = Item.find(params[:id])
   end
end

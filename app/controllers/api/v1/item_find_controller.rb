class Api::V1::ItemFindController < ApplicationController
  def show
    render json: ItemSerializer.new(Item.where(request.GET).limit(1))
  end

  def index
    render json: ItemSerializer.new(Item.where(request.GET))
  end
end

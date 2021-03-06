class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.all)
  end

  def show
   render json: ItemSerializer.new(Item.find(params[:id]))
  end

  def create
    render json: Item.create(item_params)
  end

  def update
    item = Item.find(params[:id])
    render json: item.update(item_params)
  end

  def destroy
    render json: Item.delete(params[:id])
  end


  private

  def item_params
    params.permit(:name, :description, :unit_price, :merchant_id)
  end
end

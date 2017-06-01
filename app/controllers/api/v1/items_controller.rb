class Api::V1::ItemsController < ApplicationController

  def show
    render json: @item = Item.find(params[:id].to_i)
  end

  def create
    render json: Item.create(item_params), status: 201
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end

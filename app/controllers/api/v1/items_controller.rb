class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    render json: @item = Item.find(params[:id].to_i)
  end
  
end

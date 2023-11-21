class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(is_sale: true).page(params[:page]).per(10).order(:id)
  end

  def show
    @item = Item.find(params[:id])
  end
end

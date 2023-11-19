class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @items = Item.page(params[:page]).per(10).order(:id)
  end

  def show
    @item = Item.find(params[:id])
  end
end

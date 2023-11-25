class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @address = Address.new
    @addresses = current_customer.addresses.all
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:public_address] = "登録しました"
      redirect_to addresses_path
    else
      @addresses = current_customer.addresses.all
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:public_address] = "更新しました"
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    flash[:public_address_danger] = "削除しました"
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :post_cord, :address)
  end
end

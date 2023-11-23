class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @address=Address.new
    @addresses=Address.all
  end

  def create
    @address=Address.new(address_params)
    @address.customer_id=current_customer.id
    if @address.save
      flash[:public_address] ="登録できました"
      redirect_to addresses_path
    else
      @addresses = Address.all
      render :index
    end
  end

  def edit
    @address=Address.find(params[:id])
  end

  def update
    @address=Address.find(params[:id])
    if @address.update(address_params)
      flash[:public_address] ="更新できました"
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    address=Address.find(params[:id])
    address.destroy
    flash[:public_address] ="削除しました"
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :post_cord, :address)
  end

end

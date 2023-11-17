class Public::AddressesController < ApplicationController
  def index
    @address=Address.new
    @addresses=Address.all
  end
  
  def create
    @address=Address.new(address_params)
    if @address.save
      redirect_to :index
    else
      render :index
    end
  end
  
  def update
  end
  
  def edit
  end
  
  def destroy
  end
  
  private

  def address_params
    params.require(:address).permit(:name, :post_code, :address)
  end
  
end

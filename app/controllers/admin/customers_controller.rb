class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers=Customer.page(params[:page])
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
    @customer=Customer.find(params[:id])
  end
  
  def update
    @customer=Customer.find(params[:id])
    puts params[:id]
    if @customer.update(customer_params)
      flash[:notice] ="更新成功"
      redirect_to admin_customer_path(@customer)
    else
       @customer=Customer.find(params[:id])
      render :edit
    end
  end
  
   private

  def customer_params
    params.require(:customer).permit(:last_name,
                                     :first_name,
                                     :kana_last_name,
                                     :kana_first_name,
                                     :phone_number,
                                     :post_cord,
                                     :address,
                                     :email,
                                     :is_active)
  end
  
end

class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def check
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customers_mypage_paths
  end

  def withdraw
    current_customer.update(status: 'withdrawn')
    reset_session
    redirect_to root_path, notice: 'Successfully withdraw from Ecommerce'
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
                                     :email)
  end
end

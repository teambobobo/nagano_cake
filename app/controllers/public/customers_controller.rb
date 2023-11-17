class Public::CustomersController < ApplicationController
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
    redirect_to public_customer_path
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

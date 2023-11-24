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
    if customer.update(customer_params)
      flash[:edit] = "登録情報変更に成功しました。"
      redirect_to customers_mypage_path
    else
      flash[:edit] = "登録情報変更に失敗しました。"
      redirect_to customers_mypage_path
    end
  end

  def withdraw
    current_customer.update(is_active: false)
    reset_session
    redirect_to root_path
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

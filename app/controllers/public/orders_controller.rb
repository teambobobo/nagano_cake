class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    #@customer_address = current_customer.post_code + current_customer.address + current_customer.current_last_name + customer.frist_name
  end

  def check
    @order = Order.new(order_params)
    @postage = 800
    @payment_method = params[:order][:payment_method]
    @address_option = params[:order][:address_option]
    puts @address_option
    if @address_option == "1"
      @order.address_name = current_customer.last_name + current_customer.first_name
      @order.post_code = current_customer.post_cord
      @order.address = current_customer.address
    elsif @address_option == "2"
      @order.address_name = Address.find(params[:order][:address_id]).name
      @order.post_code = Address.find(params[:order][:address_id]).post_cord
      @order.address = Address.find(params[:order][:address_id]).address
    else
      if params[:order][:post_code] == "" || params[:order][:address] == "" || params[:order][:address_name] == ""
        render :new
      end
    end
    puts @address_option
    p @order
  end

  def complete
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address_name, :post_code, :address)
  end
end

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
      else
        @order.address_name = params[:order][:name]
        @order.post_code = params[:order][:post_code]
        @order.address = params[:order][:address]
      end
    end
    @cart_items = current_customer.cart_items.all
    @total = 0
    @order.customer_id = current_customer.id
  end

  def create
    @order = Order.new(order_params)
    #ordersに書かれているものを入れていく（客の情報を入れていく）
    #@order.saveしても問題ない
    if @order.save
      cart_items = current_customer.cart_items.all#一個ずつ取り出したい
    #繰り返しの構文を書く
      cart_items.each do |cart_item|
    #保存用のかご記入
        @order_details = OrderDetail.new
    #order_detailsに書かれているものをカゴに入れていく
        @order_details.item_id = cart_item.item.id#何の商品なのか判断
        @order_details.amount = cart_item.amount#何個注文したか
        @order_details.order_id = @order.id
        #@order_details.status = cart_item.status
        @order_details.after_tax = cart_item.item.after_tax
    #order_detailsを保存
        @order_details.save
      end
    #カートアイテムを空にする
      cart_items.destroy_all
      redirect_to complete_path
    else
      render :new
    end
  end

  def complete
  end

  def index
    @order = Order.all
    @order_details = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
    @postage = 800
    @order_details = OrderDetail.all
  end

  private

  def order_params
    params.require(:order).permit(:payment_method,
                                  :address_name,
                                  :post_code,
                                  :address,
                                  :total_price,
                                  :customer_id,
                                  :postage)
  end


end

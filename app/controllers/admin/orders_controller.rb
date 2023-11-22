class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @postage = 800
    @order_details = OrderDetail.all
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      @order_details.update_all(status: "wait_production") if @order.status == "confirm_payment"
    end
    redirect_to admin_order_path(@order.id), notice: "注文ステータスを更新しました"
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end

#def update
#  @order = Order.find(params[:id])
#  @order_details = @order.order_details
#  if @order.update(order_params)
#    if @order.status == "入金確認"
#      @order_details.update_all(making_status: "制作待ち")
#    end
#  end
# redirect_to admin_order_path(@order)
#end
class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    order = @order_detail.order
    @order_details = order.order_details.all

    is_updated = true
    if @order_detail.update(order_detail_params)
       order.update(status: "in_production") if @order_detail.status == "in_production"
       @order_details.each do |order_detail|
          if order_detail.status != "complete"
            is_updated = false
          end
       end
       order.update(status: "prepare_ship") if is_updated
    end
    redirect_to admin_order_path(order.id), notice: "製作ステータスを更新しました"
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:status)
  end
end

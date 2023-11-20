class Admin::HomesController < ApplicationController
  def top
    @order = Order.all
    @order_details = OrderDetail.all
  end
end

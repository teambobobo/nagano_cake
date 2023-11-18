class Public::HomesController < ApplicationController
  def top
    items = Item.all
    @new_items = items
    @new_items = items.all.order(created_at: :desc).limit(4)
  end

  def about
  end
end

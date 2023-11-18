class Public::HomesController < ApplicationController
  def top
    items = Item.all
    @new_items = item
  end

  def about
  end
end

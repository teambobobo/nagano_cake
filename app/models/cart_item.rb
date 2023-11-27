class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def after_tax
    (self.before_tax * 1.10).round
  end

  def subtotal
    item.after_tax * amount
  end
  
end

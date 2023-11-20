class Address < ApplicationRecord
  belongs_to :customer

  validates :name, presence: true
  validates :post_cord, presence: true
  validates :address, presence: true

  def address_display
  '〒' + post_cord + ' ' + address + ' ' + name
  end
end

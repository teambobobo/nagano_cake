class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :before_tax, presence: true
  validates :image, presence: true
end
class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :before_tax, presence: true
  validates :image, presence: true

# このメソッドがないと販売ステータスが日本語ではなくtrue, falseと表示される。
  def sale_status(item)
    if item.is_sale
      '販売中'
    else
      '販売停止中'
    end
  end

# 税込み価格を表示するためのメソッド。
  def after_tax
    (self.before_tax * 1.10).round
  end

# 検索機能のためのメソッド
  def self.looks(search, word)
    if search == "partial_match"
      @item = Item.where("name LIKE?", "%#{word}%")
    end
  end
end
class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum status: { cannot_start: 0, wait_production: 1, in_production: 2, complete: 3 }
  # （0=着手不可、1=製作待ち、2=製作中、3=製作完了）
end

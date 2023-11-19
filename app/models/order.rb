class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { wait_payment: 0, confirm_payment: 1, in_production: 2, prepare_ship: 3, sent: 4 }
  # (0=入金待ち、1=入金確認、2=製作中、3=発送準備中、4=発送済み)
end

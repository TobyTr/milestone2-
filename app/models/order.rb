# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id          :bigint           not null, primary key
#  status      :string
#  total_price :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Order < ApplicationRecord
  has_one :payment, dependent: :destroy

  has_many(
    :order_items,
    class_name:  'OrderItem',
    foreign_key: 'part_id',
    inverse_of:  :part,
    dependent:   :destroy
  )
  has_many :parts, through: :order_items

  def total_amount
    # setting default to $1000 to test
    1000
  end
end

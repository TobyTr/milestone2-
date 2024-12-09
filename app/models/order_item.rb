# frozen_string_literal: true

# == Schema Information
#
# Table name: order_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer
#  part_id    :integer
#
class OrderItem < ApplicationRecord
  belongs_to(
    :order,
    class_name:  'Order',
    foreign_key: 'order_id',
    inverse_of:  :orders
  )
  belongs_to(
    :part,
    class_name:  'Part',
    foreign_key: 'part_id',
    inverse_of:  :part
  )
end

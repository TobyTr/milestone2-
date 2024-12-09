# frozen_string_literal: true

# == Schema Information
#
# Table name: payments
#
#  id         :bigint           not null, primary key
#  cardNumber :string
#  cvv        :integer
#  expDate    :integer
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :bigint           not null
#
# Indexes
#
#  index_payments_on_order_id  (order_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#
class Payment < ApplicationRecord
  belongs_to :order

  validates :cardNumber, presence:     true,
                         length:       { is: 16, message: 'must be 16 digits' },
                         numericality: { only_integer: true }

  validates :cvv, presence:     true,
                  length:       { is: 3, message: 'must be 3 digits' },
                  numericality: { only_integer: true }

  validates :expDate, presence:     true,
                      length:       { is: 4, message: 'must be 4 digits (MMYY)' },
                      numericality: { only_integer: true }

  validates :price, presence:     true,
                    numericality: { greater_than: 0 }

  # validate :expiration_date_valid

  private

  def expiration_date_valid
    return if expDate.blank?

    month = expDate.to_s[0..1].to_i
    year = expDate.to_s[2..3].to_i

    errors.add(:expDate, 'invalid month') if month < 1 || month > 12

    return unless Date.new(year, month, 1) < Date.current.beginning_of_month

    errors.add(:expDate, 'card has expired')
  end
end

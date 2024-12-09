# frozen_string_literal: true

# == Schema Information
#
# Table name: parts
#
#  id          :bigint           not null, primary key
#  brand       :string
#  category    :string
#  description :text
#  image       :string
#  name        :string
#  price       :float
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Part < ApplicationRecord
  # Constants for categories
  CATEGORIES = ['GPU', 'CPU', 'Motherboard', 'Memory', 'Storage', 'CPU Cooler', 'PSU']

  has_many :build_items

  has_many(
    :order_items,
    class_name:  'OrderItem',
    foreign_key: 'order_id',
    inverse_of:  :order,
    dependent:   :destroy
  )
  has_many :orders, through: :order_items

  validates :name, presence: true, uniqueness: true
  validates :brand, presence: true, length: { in: 1..256 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
  validates :year, presence: true, numericality: true, length: { is: 4 }
  validates :category, presence: true, inclusion: {
    in:          CATEGORIES,
    allow_blank: false
  }
  validates :description, presence: true, length: { in: 1..256 }

  # has_one_attached :image
end

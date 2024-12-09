# frozen_string_literal: true

# == Schema Information
#
# Table name: build_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  slot       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  build_id   :bigint           not null
#  part_id    :bigint           not null
#
# Indexes
#
#  index_build_items_on_build_id  (build_id)
#  index_build_items_on_part_id   (part_id)
#
# Foreign Keys
#
#  fk_rails_...  (build_id => builds.id)
#  fk_rails_...  (part_id => parts.id)
#
class BuildItem < ApplicationRecord
  belongs_to :build
  belongs_to :part

  validates :quantity, presence: true
  validates :slot, presence: true, uniqueness: { scope: :build_id }, inclusion: {
    in:          ['GPU', 'CPU', 'Motherboard', 'Memory', 'Storage', 'CPU Cooler', 'PSU'],
    allow_blank: true
  }
end

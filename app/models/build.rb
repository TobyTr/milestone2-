# frozen_string_literal: true

# == Schema Information
#
# Table name: builds
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  published   :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_builds_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Build < ApplicationRecord
  belongs_to(
    :creator,
    class_name:  'User',
    foreign_key: 'user_id',
    inverse_of:  :builds
  )

  has_many :build_items, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :published, inclusion: { in: [true, false] }
end

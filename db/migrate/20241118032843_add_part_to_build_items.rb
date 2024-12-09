class AddPartToBuildItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :build_items, :part, null: false, foreign_key: true
  end
end

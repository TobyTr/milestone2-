class AddImageToParts < ActiveRecord::Migration[7.0]
  def change
    add_column :parts, :image, :string
  end
end

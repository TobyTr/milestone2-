class CreateParts < ActiveRecord::Migration[7.0]
  def change
    create_table :parts do |t|
      t.string :name
      t.string :brand
      t.float :price
      t.integer :year
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end

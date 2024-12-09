class CreateBuildItems < ActiveRecord::Migration[7.0]
  def change
    create_table :build_items do |t|
      t.integer :quantity
      t.string :slot
      t.references :build, null: false, foreign_key: true

      t.timestamps
    end
  end
end

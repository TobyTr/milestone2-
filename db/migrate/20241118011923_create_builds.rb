class CreateBuilds < ActiveRecord::Migration[7.0]
  def change
    create_table :builds do |t|
      t.string :name
      t.string :description
      t.boolean :published

      t.timestamps
    end
  end
end

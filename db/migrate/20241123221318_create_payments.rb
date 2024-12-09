class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.decimal :price
      t.string :cardNumber
      t.integer :expDate
      t.integer :cvv

      t.timestamps
    end
  end
end

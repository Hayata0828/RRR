class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :quantity
      t.integer :quantity_price
      t.integer :user_id
      t.string :user_name
      t.string :user_mail
      t.integer :user_phonenumber
      t.string :user_addres

      t.timestamps
    end
  end
end

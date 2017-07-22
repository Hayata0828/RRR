class CreateProductImages < ActiveRecord::Migration[5.1]
  def change
    create_table :product_images do |t|
      t.integer :product_id
      t.string :image_main_id
      t.string :image_sub1_id
      t.string :image_sub2_id

      t.timestamps
    end
  end
end

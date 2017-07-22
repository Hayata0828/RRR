class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :category
      t.string :image_main_id
      t.string :image_sub1_id
      t.string :image_sub2_id

      t.timestamps
    end
  end
end

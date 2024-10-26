class CreateSavedProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :saved_products do |t|
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end

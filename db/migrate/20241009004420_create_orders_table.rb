class CreateOrdersTable < ActiveRecord::Migration[7.1]
  def change
    create_table :orders_tables do |t|
      t.integer :user_id
      t.decimal :subtotal, precision: 9, scale: 2
      t.decimal :tax, precision: 9, scale: 2
      t.decimal :total, precision: 9, scale: 2
      t.timestamps
    end
  end
end

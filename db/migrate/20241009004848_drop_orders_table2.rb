class DropOrdersTable2 < ActiveRecord::Migration[7.1]
  def change
    drop_table :orders_tables
  end
end

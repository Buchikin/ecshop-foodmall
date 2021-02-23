class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.integer :count, null: false
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end

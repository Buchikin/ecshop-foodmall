class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.integer :shopcategory_id, null: false
      t.string :zip_code, null: false
      t.string :address, null: false
      t.string :phone_number, null: false
      t.string :url
      t.text :information, null: false
      t.string :responsible, null: false
      t.string :responsible_kana, null: false
      t.string :responsible_phone, null: false
      t.references :seller, null: false, foreign_key: true
      t.timestamps
    end
  end
end

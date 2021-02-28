class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :zip_code, null: false
      t.string :address, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :information, null: false
      t.string :tag1
      t.string :tag2
      t.string :tag3
      t.string :tag4
      t.string :tag5
      t.string :allergies, null: false
      t.integer :prefecture_id, null: false
      t.integer :ship_day_id, null: false
      t.integer :ship_type_id, null: false
      t.references :seller, null: false, foreign_key: true
      t.timestamps
    end
  end
end

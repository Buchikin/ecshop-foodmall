class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :evaluation, null: false
      t.text :text, null: false
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end

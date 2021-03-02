class CreateFavoriteSellers < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_sellers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: true
      t.boolean :checked
      t.timestamps
    end
  end
end

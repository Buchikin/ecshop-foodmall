class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.date :birth_day, null: false
      t.string :phone_number, null: false
      t.string :zip_code, null: false
      t.string :address, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

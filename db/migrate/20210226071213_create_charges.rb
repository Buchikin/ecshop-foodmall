class CreateCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :charges do |t|
      t.integer :pay, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

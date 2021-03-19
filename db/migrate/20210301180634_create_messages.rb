class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :item_name, null: false
      t.text :message, null: false
      t.string :whom, null: false
      t.references :room, null: false, foreign_key: true
      t.timestamps
    end
  end
end

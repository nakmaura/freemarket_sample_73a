class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.timestamps
      t.string :name, null: false
      t.text :introduction, null: false
      # t.references :category, null: false, foreign_key: true
      # t.references	:brand, foreign_key: true
      t.integer :price, null: false
      # t.references :seller, null: false, foreign_key: true
      # t.references :buyer, foreign_key: true
      t.string :seller_id
      t.string :buyer_id
      t.string :prefecture_name,null: false
      t.string :condition
      t.string :postage_payer
      t.string :preparation_days
      t.timestamps
    end
  end
end
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
    end
  end
end

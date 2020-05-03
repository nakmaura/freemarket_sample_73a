class CreatePostages < ActiveRecord::Migration[5.2]
  def change
    create_table :postages do |t|
      t.string :postage_payer
      t.string :preparation_days

      t.timestamps
    end
  end
end

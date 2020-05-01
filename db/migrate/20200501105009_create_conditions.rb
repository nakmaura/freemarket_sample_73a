class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.string :condition_id

      t.timestamps
    end
  end
end

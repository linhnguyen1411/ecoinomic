class CreateStages < ActiveRecord::Migration[5.1]
  def change
    create_table :stages do |t|
      t.integer :stage_type
      t.string :start_date_1
      t.string :end_date_1
      t.string :start_date_2
      t.string :end_date_2
      t.integer :coin_1
      t.integer :coin_2
      t.integer :progess

      t.timestamps
    end
  end
end

class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :image
      t.integer :image_type

      t.timestamps
    end
  end
end

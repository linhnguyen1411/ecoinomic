class AddReferalIdToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ref_id, :string
  end
end

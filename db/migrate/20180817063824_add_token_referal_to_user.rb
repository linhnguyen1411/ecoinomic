class AddTokenReferalToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :token_ref, :string
  end
end

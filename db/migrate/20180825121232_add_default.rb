class AddDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :stages, :stage_type, :integer, default: 1
    add_column :stages, :start_subcrible, :string
    add_column :stages, :end_subcrible, :string
    add_column :stages, :start_register, :string
    add_column :stages, :end_register, :string
    add_column :stages, :end_ended, :string
  end
end

class ChaneSomeColumns < ActiveRecord::Migration[5.1]
  def change
    Stage.delete_all
    change_column :stages, :start_date_1, :datetime
    change_column :stages, :end_date_1, :datetime
    change_column :stages, :start_date_2, :datetime
    change_column :stages, :end_date_2, :datetime
  end
end

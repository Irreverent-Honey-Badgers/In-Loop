class ChangeNames < ActiveRecord::Migration
  def change
    rename_column :appointments, :start_datetime, :start
    rename_column :appointments, :end_datetime, :end
  end
end

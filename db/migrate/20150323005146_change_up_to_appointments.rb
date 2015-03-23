class ChangeUpToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :title, :text, before: :address
    add_column :appointments, :start_datetime, :datetime, before: :address
    add_column :appointments, :end_datetime, :datetime, before: :address
    add_column :appointments, :description, :text, before: :eta
    remove_column :appointments, :favorite
    remove_column :appointments, :purpose
    remove_column :appointments, :appointment_time
  end
end

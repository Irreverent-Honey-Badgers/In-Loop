class RenameLocationsToAppointments < ActiveRecord::Migration
  def change
    rename_table :locations, :appointments
  end
end

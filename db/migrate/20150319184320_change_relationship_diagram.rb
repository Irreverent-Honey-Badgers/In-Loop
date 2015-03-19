class ChangeRelationshipDiagram < ActiveRecord::Migration
  def change
    add_column :doctors, :provider, :string
    add_column :doctors, :did, :string
    remove_column :patients, :eta
    add_column :locations, :eta, :string
    add_column :locations, :purpose, :text
    add_column :locations, :appointment_time, :datetime
    rename_table :locations, :appointments
  end
end
